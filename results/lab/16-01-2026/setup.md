---
date: 16-01-2026
background: |
    # This is a normal user workload and reflects reality.
    Steam, Discord, Brave Browser with Youtube and Amazon Websites
foreground: |
    green-languages --rapl --misses --cycles --cstates -i60 -s10
name: "lab intel_pstate powersave"
attributes:
    kernel_params:
        single_thread: [nosmt, intel_idle.max_cstate=0, processor.max_cstate=0, isolcpus=5, nohz_full=5]
        multi_thread: [nosmt, intel_idle.max_cstate=0, processor.max_cstate=0]
    kernel_sysctl: [kernel.randomize_va_space=0]
    swap_devices: ~
    tlp: |
        CPU_DRIVER_OPMODE=active
        CPU_SCALING_GOVERNOR=powersave
        CPU_BOOST=0
        CPU_MIN_PERF=17
        CPU_MAX_PERF=17
        PLATFORM_PROFILE=low-power
        CPU_ENERGY_PERF_POLICY=power
        CPU_HWP_DYN_BOOST=0
scenarios:
    languages: [c, cpp, cs, java, rust]
    single_thread:
        pe: [dl, mm, pe]
        clbg: [pidigits, n_body]
    multi_thread:
        clbg: [binary_trees, fannkuch_redux, fasta, k_nucleotide, mandelbrot, regex_redux, reverse_complement, spectral_norm]
---

## Mean and CV% grouped by language and scenario.
