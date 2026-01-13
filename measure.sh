#!/bin/bash

clbg_lab_single=()
while IFS= read -r line; do clbg_lab_single+=("$line"); done < <(
  find clbg/lab -type f \( -name "pidigits.yml" -o -name "n_body.yml" \) | shuf
)
clbg_lab_multi=()
while IFS= read -r line; do clbg_lab_multi+=("$line"); done < <(
  find clbg/lab -type f \( -name "binary_trees.yml" -o -name "fannkuch_redux.yml" \
    -o -name "fasta.yml" -o -name "k_nucleotide.yml" -o -name "mandelbrot.yml" \
    -o -name "regex_redux.yml" -o -name "reverse_complement.yml" -o -name "spectral_norm.yml" \) | shuf
)

clbg_user_single=()
while IFS= read -r line; do clbg_user_single+=("$line"); done < <(
  find clbg/user -type f \( -name "pidigits.yml" -o -name "n_body.yml" \) | shuf
)
clbg_user_multi=()
while IFS= read -r line; do clbg_user_multi+=("$line"); done < <(
  find clbg/user -type f \( -name "binary_trees.yml" -o -name "fannkuch_redux.yml" \
    -o -name "fasta.yml" -o -name "k_nucleotide.yml" -o -name "mandelbrot.yml" \
    -o -name "regex_redux.yml" -o -name "reverse_complement.yml" -o -name "spectral_norm.yml" \) | shuf
)

ps_lab_single=()
while IFS= read -r line; do ps_lab_single+=("$line"); done < <(
  find ps/lab -type f \( -name "dl.yml" -o -name "mm.yml" -o -name "pe.yml" \) | shuf
)
ps_user_single=()
while IFS= read -r line; do ps_user_single+=("$line"); done < <(
  find ps/user -type f \( -name "dl.yml" -o -name "mm.yml" -o -name "pe.yml" \) | shuf
)

# Lab Setup for Intel i7_8700
enter_i7_8700_lab() {
    green-languages-profiles cpu enable
    green-languages-profiles cpu disable ht
    green-languages-profiles cpu disable cs
    green-languages-profiles cache drop
    green-languages-profiles aslr disable
    swapoff -a
    green-languages-profiles profile i7_8700_active_power
    green-languages-profiles profile i7_8700_active_power
}

# User Setup for Intel i7_8700
enter_i7_8700_user() {
    green-languages-profiles cpu enable
    green-languages-profiles cpu enable ht
    green-languages-profiles cpu enable cs
    green-languages-profiles aslr enable
    swapon -a
    green-languages-profiles profile i7_8700_active_user
    green-languages-profiles profile i7_8700_active_user
}

# Synthetic workload
# nix-shell -p stress-ng --run "stress-ng --cpu 2 --cpu-load 15 --iomix 1 --vm 1 --hdd 1 --timeout 0" & sleep 5
