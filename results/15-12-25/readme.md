stress-ng --cpu 2 --cpu-load 15 --iomix 1 --vm 1 --hdd 1 --timeout 0
i7_8700_active_power_profile

gl ${scenarios[*]} --rapl --misses --cycles --cstates -i60 -s10

GRUB_CMDLINE_LINUX="" # for multi threaded
GRUB_CMDLINE_LINUX="isolcpus=5 nohz_full=5 rcu_nocbs=5" # for single threaded

glp cpu enable
glp cpu enable ht
glp cpu enable cs
glp aslr enable
swapon -a
glp profile i7_8700_active_user
glp profile i7_8700_active_user



