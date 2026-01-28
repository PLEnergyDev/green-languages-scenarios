date: 24-01-2026
setup:
    attributes:
        global: [
            cstates=hlt, aslr=0, swaps=[], smt=1
            driver=intel_pstate, governor=powersave, boost=0,
            minperf=0, maxperf=0, profile=low-power, epp=power, dyn_boost=0
            nicencess=-20
        ]
        single_thread: [isolcpus=5, affinity=5]
        background: |
            # This is the gamer bg workload and reflects reality.
            discord & steam &
            brave --new-window --no-first-run --disable-session-crashed-bubble \
                "https://www.youtube.com/watch?v=ZEPQDxEXRBU&autoplay=1&mute=1&start=30" \
                "https://www.reddit.com/" "https://itch.io/" "https://www.reddit.com/"
target: |
    green-languages <scenarios> --rapl --misses --cycles --cstates -i30 -s10
scenarios:
    single_thread:
        languages: [c, cpp, cs, java, rust]
        ps: [division-loop, matrix-multiplication, polynomial-evaluation]
    multi_thread:
        languages: [c, cpp, cs, java]
        clbg: [binary-trees, fannkuch-redux, fasta, k-nucleotide, mandelbrot, regex-redux, reverse-complement, spectral-norm]

---
date: 23-01-2026
setup:
    attributes:
        global: [
            cstates=hlt, aslr=0, swaps=[], smt=0
            driver=intel_pstate, governor=powersave, boost=0,
            minperf=0, maxperf=0, profile=low-power, epp=power, dyn_boost=0
            nicencess=-20
        ]
        single_thread: [isolcpus=5, affinity=5]
        background: |
            discord & steam &
            brave --new-window --no-first-run --disable-session-crashed-bubble \
                "https://www.youtube.com/watch?v=ZEPQDxEXRBU&autoplay=1&mute=1&start=30" \
                "https://www.reddit.com/" "https://itch.io/" "https://www.reddit.com/"
target: |
    green-languages <scenarios> --rapl --misses --cycles --cstates -i30 -s10
scenarios:
    single_thread:
        ps: [division-loop, matrix-multiplication, polynomial-evaluation]
        clbg: [pidigits, n-body]
    multi_thread:
        languages: [c, cpp, cs, java]
        clbg: [binary-trees, fannkuch-redux, fasta, k-nucleotide, mandelbrot, regex-redux, reverse-complement, spectral-norm]

---
date: 22-01-2026
target: |
    green-languages <scenarios> --rapl --misses --cycles --cstates -i30 -s10
setup:
    attributes:
        global: [
            cstates=poll, aslr=0, swaps=[], smt=0
            driver=intel_pstate, governor=powersave, boost=0,
            minperf=0, maxperf=0, profile=low-power, epp=power, dyn_boost=0
            nicencess=-20
        ]
        single_thread: [isolcpus=5, affinity=5]
        background: |
            discord & steam &
            brave --new-window --no-first-run --disable-session-crashed-bubble \
                "https://www.youtube.com/watch?v=ZEPQDxEXRBU&autoplay=1&mute=1&start=30" \
                "https://www.reddit.com/" "https://itch.io/" "https://www.reddit.com/"
    single_thread:
        languages: [c, cpp, cs, java, rust]
        ps: [division-loop, matrix-multiplication, polynomial-evaluation]
    multi_thread:
        languages: [c, cpp, cs, java]
        clbg: [binary-trees, fannkuch-redux, fasta, k-nucleotide, mandelbrot, regex-redux, reverse-complement, spectral-norm]

---
date: 21-01-2026
background: |
    # stress-ng is a completely synthetic workload; it does not reflect reality.
    stress-ng --cpu 2 --cpu-load 15 --iomix 1 --vm 1 --hdd 1 --timeout 0
target: |
    green-languages <scenarios> --rapl --misses --cycles --cstates -i30 -s10
setup:
    attributes:
        global: [
            cstates=poll, aslr=0, swaps=[], smt=0
            driver=intel_pstate, governor=powersave, boost=0,
            minperf=0, maxperf=0, profile=low-power, epp=power, dyn_boost=0
            nicencess=-20
        ]
        single_thread: [isolcpus=5, affinity=5]
    single_thread:
        languages: [c, cpp, cs, java, rust]
        ps: [division-loop, matrix-multiplication, polynomial-evaluation]
    multi_thread:
        languages: [c, cpp, cs, java]
        clbg: [binary-trees, fannkuch-redux, fasta, k-nucleotide, mandelbrot, regex-redux, reverse-complement, spectral-norm]

---
date: 20-01-2026
target: |
    green-languages <scenarios> --rapl --misses --cycles --cstates -i30 -s10
setup:
    attributes:
        global: [
            cstates=hlt, aslr=0, swaps=[], smt=0
            driver=intel_pstate, governor=powersave, boost=0,
            minperf=0, maxperf=0, profile=low-power, epp=power, dyn_boost=0
            nicencess=-20
        ]
        single_thread: [isolcpus=5, affinity=5]
        background: |
            stress-ng --cpu 2 --cpu-load 15 --iomix 1 --vm 1 --hdd 1 --timeout 0
scenarios:
    single_thread:
        languages: [c, cpp, cs, java, rust]
        ps: [division-loop, matrix-multiplication, polynomial-evaluation]
        clbg: [pidigits, n-body]
    multi_thread:
        languages: [c, cpp, cs, java]
        clbg: [binary-trees, fannkuch-redux, fasta, k-nucleotide, mandelbrot, regex-redux, reverse-complement, spectral-norm]

---
date: 19-01-2026
setup:
    attributes:
        global: [
            cstates=hlt, aslr=0, swaps=[], smt=0
            driver=intel_pstate, governor=powersave, boost=0,
            minperf=0, maxperf=100, profile=performance, epp=balance_performance, dyn_boost=0
            nicencess=-20
        ]
        single_thread: [isolcpus=5, affinity=5]
        background: |
            stress-ng --cpu 2 --cpu-load 15 --iomix 1 --vm 1 --hdd 1 --timeout 0
target: |
    green-languages <scenarios> --rapl --misses --cycles --cstates -i30 -s10
scenarios:
    single_thread:
        languages: [c, cpp, cs, java, rust]
        ps: [division-loop, matrix-multiplication, polynomial-evaluation]
        clbg: [pidigits, n-body]
    multi_thread:
        languages: [c, cpp, cs, java]
        clbg: [binary-trees, fannkuch-redux, fasta, k-nucleotide, mandelbrot, regex-redux, reverse-complement, spectral-norm]

