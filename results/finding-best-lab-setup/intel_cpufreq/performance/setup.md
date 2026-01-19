---
date: 26-11-2025
background: |
    # `stress-ng` is a completely synthetic workload; it does not reflect reality.
    stress-ng --cpu 2 --cpu-load 15 --iomix 1 --vm 1 --hdd 1 --timeout 0
foreground: |
    green-languages --rapl --misses --cycles --cstates -i60 -s10
name: "lab intel_cpufreq performance"
attributes:
    kernel_params:
        single_thread: [nosmt, intel_idle.max_cstate=0, processor.max_cstate=0, isolcpus=5, nohz_full=5]
        multi_thread: [nosmt, intel_idle.max_cstate=0, processor.max_cstate=0]
    kernel_sysctl: [kernel.randomize_va_space=0]
    swap_devices: ~
    tlp: |
        CPU_DRIVER_OPMODE=passive
        CPU_SCALING_GOVERNOR=performance
        CPU_BOOST=0
        CPU_MIN_PERF=17
        CPU_MAX_PERF=17
        PLATFORM_PROFILE=performance
        CPU_ENERGY_PERF_POLICY=performance
        CPU_HWP_DYN_BOOST=0
scenarios:
    languages: [c, cpp, cs, java, rust]
    single_thread:
        pe: [dl, mm, pe]
        clbg: [pidigits, n_body]
    multi_thread:
        clbg: [binary_trees, fannkuch_redux, fasta, k_nucleotide, mandelbrot, regex_redux, reverse_complement, spectral_norm]
---

