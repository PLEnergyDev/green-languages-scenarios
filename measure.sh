#!/bin/bash

deps=(
    "gcc"
    "graalvmPackages.graalvm-ce"
    "jdk25"
    "dotnetCorePackages.sdk_9_0.unwrapped"
    "htslib"
    "gmp"
    "apr"
    "pcre2"
    "boost"
)
libs=("htslib.out" "gmp.out" "apr.out" "pcre2.out" "boost.out")
single=(
    "pidigits" "n_body" # CLBG
    "dl" "mm" "pe"      # PS
)
multi=(
    "binary_trees" "fannkuch_redux" "fasta" "k_nucleotide" "mandelbrot" \
    "regex_redux" "reverse_complement" "spectral_norm" # CLBG
)
root_dirs=(
    clbg/lab/c clbg/lab/cpp clbg/lab/cs clbg/lab/java
    ps/lab/c ps/lab/cpp ps/lab/cs ps/lab/java
)

measure() {
    local -a scenarios=("$@")

    NIX_ENFORCE_NO_NATIVE="" \
    GL_LD_LIBRARY_PATH="$paths" \
    GL_LIBRARY_PATH="$paths" \
    GL_CPATH="$paths" \
    DOTNET_ROOT="$dotnet_root" \
    nix-shell -p "${deps[@]}" "${libs[@]}" --run \
        "gl ${scenarios[*]} --rapl --misses --cycles --cstates -i60 -s10"
}

# Lab Setup for Intel i7_8700
i7_8700_active_power_profile() {
    glp cpu enable
    glp cpu disable ht
    glp cpu disable cs
    glp cache drop
    glp aslr disable
    swapoff -a
    glp profile i7_8700_active_power
    glp profile i7_8700_active_power
}

# User Setup for Intel i7_8700
i7_8700_active_user_profile() {
    glp cpu enable
    glp cpu enable ht
    glp cpu enable cs
    glp aslr enable
    swapon -a
    glp profile i7_8700_active_user
    glp profile i7_8700_active_user
}

cleanup() {
    pkill -fi "stress-ng"
    i7_8700_active_user_profile
}

main() {
    trap cleanup EXIT INT TERM

    for pkg in "${libs[@]}"; do
        args+=(-A "$pkg")
    done
    paths=$(nix-build '<nixpkgs>' "${args[@]}" --no-out-link)
    paths=$(echo "$paths" | sed 's|$|/lib|' | paste -sd: -)
    dotnet_root=$(nix-build '<nixpkgs>' -A dotnetCorePackages.sdk_9_0.unwrapped --no-out-link)/share/dotnet

    shopt -s globstar nullglob

    mapfile -t single_scenarios < <(
        for name in "${single[@]}"; do
            for d in "${root_dirs[@]}"; do
                printf '%s\n' "$d"/**/"${name}"*_process.yml
            done
        done
    )

    mapfile -t multi_scenarios < <(
        for name in "${multi[@]}"; do
            for d in "${root_dirs[@]}"; do
                printf '%s\n' "$d"/**/"${name}"*_process.yml
            done
        done
    )

    mapfile -t shuffled_single < <(printf '%s\n' "${single_scenarios[@]}" | shuf)
    mapfile -t shuffled_multi  < <(printf '%s\n' "${multi_scenarios[@]}" | shuf)

    i7_8700_active_power_profile

    nix-shell -p stress-ng --run "stress-ng --cpu 2 --cpu-load 15 --iomix 1 --vm 1 --hdd 1 --timeout 0" & sleep 5

    # measure "${shuffled_single[@]}" "${shuffled_multi[@]}"
    measure "${shuffled_multi[@]}"
}

main
