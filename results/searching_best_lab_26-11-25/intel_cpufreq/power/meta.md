---
date: 26-11-2025
bg_workload: ~
config:
    name: "intel_cpufreq driver/powersave settings"
    tlp: |
        CPU_DRIVER_OPMODE_ON_AC=passive
        CPU_DRIVER_OPMODE_ON_BAT=passive
        CPU_SCALING_GOVERNOR_ON_AC=powersave
        CPU_SCALING_GOVERNOR_ON_BAT=powersave
        CPU_BOOST_ON_AC=0
        CPU_BOOST_ON_BAT=0
        CPU_MIN_PERF_ON_AC=17
        CPU_MAX_PERF_ON_AC=17
        CPU_MIN_PERF_ON_BAT=17
        CPU_MAX_PERF_ON_BAT=17
        PLATFORM_PROFILE_ON_AC=low-power
        PLATFORM_PROFILE_ON_BAT=low-power
        CPU_ENERGY_PERF_POLICY_ON_AC=power
        CPU_ENERGY_PERF_POLICY_ON_BAT=power
        CPU_HWP_DYN_BOOST_ON_AC=0
        CPU_HWP_DYN_BOOST_ON_BAT=0
        NMI_WATCHDOG=0
    single_threaded_kernel_params: |
        GRUB_CMDLINE_LINUX="isolcpus=5 nohz_full=5 rcu_nocbs=5"
    multi_threaded_kernel_params: |
        GRUB_CMDLINE_LINUX=""
scenarios:
    languages: [c, cpp, cs, java]
    single_threaded:
        - pe: [dl, mm, pe]
        - clbg: [pidigits, n_body]
    multi_threaded:
        - clbg: [binary_trees, fannkuch_redux, fasta, k_nucleotide, mandelbrot, regex_redux, reverse_complement, spectral_norm]
green_languages_flags: [--rapl, --misses, --cycles, --cstates, -i60]
---
