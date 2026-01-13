---
date: 15-12-2025
bg_workload: |
    stress-ng --cpu 2 --cpu-load 15 --iomix 1 --vm 1 --hdd 1 --timeout 0
config:
    name: lab
    single_threaded:
        kernel_params: |
            GRUB_CMDLINE_LINUX="isolcpus=5 nohz_full=5 rcu_nocbs=5"
    multi_threaded:
        kernel_params: |
            GRUB_CMDLINE_LINUX=""
scenarios:
    languages: [c, cpp, cs, java]
    single_threaded:
        - pe: [dl, mm, pe]
        - clbg: [pidigits, n_body]
    multi_threaded:
        - clbg: [binary_trees, fannkuch_redux, fasta, k_nucleotide, mandelbrot, regex_redux, reverse_complement, spectral_norm]
flags: [--rapl --misses --cycles --cstates -i60 -s10]
---

`stress-ng` is a completely synthetic workload; it does not reflect reality.
We pin single threaded scenarios on core 5 and we isolate that core in the kernel boot parameters.
The `lab` config means a controlled computer environment where hardware capabilities are reduces to minimum to reduce energy use and heat which promotes reproducibility in measurements.

