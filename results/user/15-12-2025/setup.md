---
date: 15-12-2025
background: |
    # `stress-ng` is a completely synthetic workload; it does not reflect reality.
    stress-ng --cpu 2 --cpu-load 15 --iomix 1 --vm 1 --hdd 1 --timeout 0
foreground: |
    green-languages --rapl --misses --cycles --cstates -i60 -s10
name: "user intel_pstate powersave"
attributes:
    kernel_params: ~
    kernel_sysctl: ~
    swap_devices: ~
    tlp: |
        CPU_DRIVER_OPMODE=active
        CPU_SCALING_GOVERNOR=powersave
        CPU_BOOST=1
        CPU_MIN_PERF=0
        CPU_MAX_PERF=100
        PLATFORM_PROFILE=performance
        CPU_ENERGY_PERF_POLICY=balance_performance
        CPU_HWP_DYN_BOOST=1
scenarios:
    languages: [c, cpp, cs, java, rust]
    single_thread:
        pe: [dl, mm, pe]
        clbg: [pidigits, n_body]
    multi_thread:
        clbg: [binary_trees, fannkuch_redux, fasta, k_nucleotide, mandelbrot, regex_redux, reverse_complement, spectral_norm]
---

## Mean and CV% grouped by language and scenario.

