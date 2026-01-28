date: 28-01-2026
setup:
    name: nofreq
    parameters:
        global: [
            cstates=enabled, aslr=1, swaps=[], smt=1
            driver=intel_pstate, governor=powersave, boost=1,
            minperf=0, maxperf=0, profile=performance, epp=balance_performance, dyn_boost=1
        ]
        single_thread: []
        background: |
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
        clbg: [pidigits, n-body]
    multi_thread:
        languages: [c, cpp, cs, java]
        clbg: [binary-trees, fannkuch-redux, fasta, k-nucleotide, mandelbrot, regex-redux, reverse-complement, spectral-norm]

---
date: 28-01-2026-07:25
setup:
    name: nodyn
    parameters:
        global: [
            cstates=enabled, aslr=1, swaps=[], smt=1
            driver=intel_pstate, governor=powersave, boost=1,
            minperf=0, maxperf=100, profile=performance, epp=balance_performance, dyn_boost=0
        ]
        single_thread: []
        background: |
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
        clbg: [pidigits, n-body]
    multi_thread:
        languages: [c, cpp, cs, java]
        clbg: [binary-trees, fannkuch-redux, fasta, k-nucleotide, mandelbrot, regex-redux, reverse-complement, spectral-norm]

---
date: 27-01-2026-17:38
setup:
    name: noboost
    parameters:
        global: [
            cstates=enabled, aslr=1, swaps=[], smt=1
            driver=intel_pstate, governor=powersave, boost=0,
            minperf=0, maxperf=100, profile=performance, epp=balance_performance, dyn_boost=1
        ]
        single_thread: []
        background: |
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
        clbg: [pidigits, n-body]
    multi_thread:
        languages: [c, cpp, cs, java]
        clbg: [binary-trees, fannkuch-redux, fasta, k-nucleotide, mandelbrot, regex-redux, reverse-complement, spectral-norm]

---
date: 27-01-2026-06:49
setup:
    name: 
    parameters:
        global: [
            cstates=poll, aslr=1, swaps=[], smt=1
            driver=intel_pstate, governor=powersave, boost=1,
            minperf=0, maxperf=100, profile=performance, epp=balance_performance, dyn_boost=1
        ]
        single_thread: []
        background: |
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
        clbg: [pidigits, n-body]
    multi_thread:
        languages: [c, cpp, cs, java]
        clbg: [binary-trees, fannkuch-redux, fasta, k-nucleotide, mandelbrot, regex-redux, reverse-complement, spectral-norm]

---
date: 26-01-2026
setup:
    parameters:
        global: [
            cstates=hlt, aslr=1, swaps=[], smt=1
            driver=intel_pstate, governor=powersave, boost=1,
            minperf=0, maxperf=100, profile=performance, epp=balance_performance, dyn_boost=1
        ]
        single_thread: []
        background: |
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
        clbg: [pidigits, n-body]
    multi_thread:
        languages: [c, cpp, cs, java]
        clbg: [binary-trees, fannkuch-redux, fasta, k-nucleotide, mandelbrot, regex-redux, reverse-complement, spectral-norm]

---
date: 25-01-2026
setup:
    parameters:
        global: [
            cstates=enabled, aslr=0, swaps=[], smt=1
            driver=intel_pstate, governor=powersave, boost=1,
            minperf=0, maxperf=100, profile=performance, epp=balance_performance, dyn_boost=1
        ]
        single_thread: []
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

---
date: 24-01-2026
setup:
    parameters:
        global: [
            cstates=enabled, aslr=1, swaps=[], smt=0
            driver=intel_pstate, governor=powersave, boost=1,
            minperf=0, maxperf=100, profile=performance, epp=balance_performance, dyn_boost=1
        ]
        single_thread: []
        background: |
            stress-ng --cpu 2 --cpu-load 15 --iomix 1 --vm 1 --hdd 1 --timeout 0
target: |
    green-languages <scenarios> --rapl --misses --cycles --cstates -i30 -s10
scenarios:
    single_thread:
        languages: [c, cpp, cs, java, rust]
        ps: [dl, mm, pe]
        clbg: [pidigits, n-body]
    multi_thread:
        languages: [c, cpp, cs, java]
        clbg: [binary-trees, fannkuch-redux, fasta, k-nucleotide, mandelbrot, regex-redux, reverse-complement, spectral-norm]

---
date: 23-01-2026-20:20
setup:
    parameters:
        global: [
            cstates=enabled, aslr=1, swaps=[], smt=1
            driver=intel_pstate, governor=powersave, boost=1,
            minperf=0, maxperf=100, profile=performance, epp=balance_performance, dyn_boost=1
        ]
        single_thread: []
        background: |
            # stress-ng is a completely synthetic workload; it does not reflect reality.
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

---
date: 23-01-2026-14:13
setup:
    parameters:
        global: [
            cstates=enabled, aslr=1, swaps=[], smt=1
            driver=intel_pstate, governor=powersave, boost=1,
            minperf=0, maxperf=100, profile=performance, epp=balance_performance, dyn_boost=1
        ]
        single_thread: []
        background: |
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
        clbg: [pidigits, n-body]
    multi_thread:
        languages: [c, cpp, cs, java]
        clbg: [binary-trees, fannkuch-redux, fasta, k-nucleotide, mandelbrot, regex-redux, reverse-complement, spectral-norm]

