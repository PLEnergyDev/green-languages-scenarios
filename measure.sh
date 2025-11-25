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
single_threaded=(
    "pidigits" "n_body" # CLBG
    "dl" "mm" "pe"      # PS
)
multi_threaded=(
    "binary_trees" "fannkuch_redux" "fasta" "k_nucleotide" "mandelbrot" \
    "regex_redux" "reverse_complement" "spectral_norm" # CLBG
)
root_dirs=(
    clbg/c clbg/cpp clbg/cs clbg/java
    ps/c ps/cpp ps/cs ps/java
)

for pkg in "${libs[@]}"; do
  args+=(-A "$pkg")
done
paths=$(nix-build '<nixpkgs>' "${args[@]}" --no-out-link)
paths=$(echo "$paths" | sed 's|$|/lib|' | paste -sd: -)
dotnet_root=$(nix-build '<nixpkgs>' -A dotnetCorePackages.sdk_9_0.unwrapped --no-out-link)/share/dotnet

shopt -s globstar nullglob

mapfile -t single_threaded_scenarios < <(
  for name in "${single_threaded[@]}"; do
    for d in "${root_dirs[@]}"; do
      printf '%s\n' "$d"/**/"${name}"*_process.yml
    done
  done
)

mapfile -t multi_threaded_scenarios < <(
  for name in "${multi_threaded[@]}"; do
    for d in "${root_dirs[@]}"; do
      printf '%s\n' "$d"/**/"${name}"*_process.yml
    done
  done
)

mapfile -t shuffled_single < <(printf '%s\n' "${single_threaded_scenarios[@]}" | shuf)
mapfile -t shuffled_multi  < <(printf '%s\n' "${multi_threaded_scenarios[@]}" | shuf)

cleanup() {
    sudo glp cpu enable
    sudo glp cpu enable ht
    sudo glp cpu enable cs
    sudo glp aslr enable
    sudo swapon -a
    sudo glp profile i7_8700_default
    sudo glp profile i7_8700_default
}

trap cleanup EXIT INT TERM

measure() {
    local out_csv="$1"
    shift
    local -a scenarios=("$@")

    NIX_ENFORCE_NO_NATIVE="" \
    GL_LD_LIBRARY_PATH="$paths" \
    GL_LIBRARY_PATH="$paths" \
    GL_CPATH="$paths" \
    DOTNET_ROOT="$dotnet_root" \
    nix-shell -p "${deps[@]}" "${libs[@]}" --run \
        "gl ${scenarios[*]} --rapl --misses --cycles --cstates -i60 -s60 -o $out_csv"
}

sudo glp cpu enable
sudo glp aslr disable
sudo swapoff -a
sudo glp cpu disable ht
sudo glp cpu disable cs

sudo glp profile i7_8700_active_power
sudo glp profile i7_8700_active_power
measure results/active_power.csv "${shuffled_multi[@]}"
# measure results/active_power.csv "${shuffled_single[@]}"

sudo glp profile i7_8700_passive_power
sudo glp profile i7_8700_passive_power
measure results/passive_power.csv "${shuffled_multi[@]}"
# measure results/passive_power.csv "${shuffled_single[@]}"

# sudo glp profile i7_8700_active_performance
# sudo glp profile i7_8700_active_performance
# measure results/active_performance.csv "${shuffled_multi[@]}"
# measure results/active_performance.csv "${shuffled_single[@]}"

# sudo glp profile i7_8700_passive_performance
# sudo glp profile i7_8700_passive_performance
# measure results/passive_performance.csv "${shuffled_multi[@]}"
# measure results/passive_performance.csv "${shuffled_single[@]}"
