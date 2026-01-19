---
date: 26-11-2025
background: |
    # `stress-ng` is a completely synthetic workload; it does not reflect reality.
    stress-ng --cpu 2 --cpu-load 15 --iomix 1 --vm 1 --hdd 1 --timeout 0
foreground: |
    green-languages --rapl --misses --cycles --cstates -i60 -s10
name: "lab acpi_cpufreq powersave"
attributes:
    kernel_params:
        single_thread: [intel_pstate=disabe, nosmt, intel_idle.max_cstate=0, processor.max_cstate=0, isolcpus=5, nohz_full=5]
        multi_thread: [intel_pstate=disable, nosmt, intel_idle.max_cstate=0, processor.max_cstate=0]
    kernel_sysctl: [kernel.randomize_va_space=0]
    swap_devices: ~
    tlp: |
        CPU_SCALING_GOVERNOR=powersave
        CPU_BOOST=0
        CPU_SCALING_MIN_FREQ=800000
        CPU_SCALING_MAX_FREQ=800000
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

