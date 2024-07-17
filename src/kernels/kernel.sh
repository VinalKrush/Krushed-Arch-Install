# Installing Selected Kernel
if [[ $KERN == '1']]
then
	pacstrap -K /mnt linux linux-firmware linux-headers
elif [[ $KERN == '2']]
then
	pacstrap -K /mnt linux-zen linux-firmware linux-headers
elif [[ $KERN == '3']]
then
	pacstrap -K /mnt linux-hardened linux-firmware linux-headers
elif [[ $KERN == '4']]
then
	pacstrap -K /mnt linux-lts linux-firmware linux-headers
fi
