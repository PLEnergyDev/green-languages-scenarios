---
date: 15-12-2025
bg_workload: |
    stress-ng --cpu 2 --cpu-load 15 --iomix 1 --vm 1 --hdd 1 --timeout 0
config:
    name: "intel_pstate driver/powersave settings/user config"
    tlp: |
        CPU_DRIVER_OPMODE_ON_AC=active
        CPU_DRIVER_OPMODE_ON_BAT=active
        CPU_SCALING_GOVERNOR_ON_AC=powersave
        CPU_SCALING_GOVERNOR_ON_BAT=powersave
        CPU_BOOST_ON_AC=1
        CPU_BOOST_ON_BAT=1
        CPU_MIN_PERF_ON_AC=0
        CPU_MAX_PERF_ON_AC=100
        CPU_MIN_PERF_ON_BAT=0
        CPU_MAX_PERF_ON_BAT=100
        PLATFORM_PROFILE_ON_AC=performance
        PLATFORM_PROFILE_ON_BAT=performance
        CPU_ENERGY_PERF_POLICY_ON_AC=balance_performance
        CPU_ENERGY_PERF_POLICY_ON_BAT=balance_performance
        CPU_HWP_DYN_BOOST_ON_AC=1
        CPU_HWP_DYN_BOOST_ON_BAT=1
        NMI_WATCHDOG=0
    single_threaded_kernel_params: ~
    multi_threaded_kernel_params: ~
scenarios:
    languages: [c, cpp, cs, java]
    single_threaded:
        - pe: [dl, mm, pe]
        - clbg: [pidigits, n_body]
    multi_threaded:
        - clbg: [binary_trees, fannkuch_redux, fasta, k_nucleotide, mandelbrot, regex_redux, reverse_complement, spectral_norm]
green_languages_flags: [--rapl, --misses, --cycles, --cstates, -i60, -s10]
---

Uses the User (Representative) config.
`stress-ng` is a completely synthetic workload; it does not reflect reality.

