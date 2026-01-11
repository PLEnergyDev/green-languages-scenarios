stress-ng --cpu 2 --cpu-load 15 --iomix 1 --vm 1 --hdd 1 --timeout 0

gl ${scenarios[*]} --rapl --misses --cycles --cstates -i60 -s60

GRUB_CMDLINE_LINUX=""

glp cpu enable
glp cpu enable ht
glp cpu enable cs
glp aslr enable
swapon -a
glp profile i7_8700_active_user
glp profile i7_8700_active_user

