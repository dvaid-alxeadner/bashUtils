 #! /bin/bash

if [[ $1 == "R" ]]; then
	echo -e "###### Suse Linux Baseline Remediation ######"
else
	echo -e "###### Suse Linux Baseline Check ######"
fi

echo -e "###### Check CIS Controls 1.1.1 Filesystem Configuration ######"

ccis=0
cfcis=0

cis1111="1.1.1.1"
cis1112="1.1.1.2"
cis1113="1.1.1.3"
cis1114="1.1.1.4"
cis1115="1.1.1.5"
cis1116="1.1.1.6"
cis1117="1.1.1.7"
cis1118="1.1.1.8"

cis112="1.1.2"
cis113="1.1.3"
cis114="1.1.4"
cis115="1.1.5"
cis116="1.1.6"
cis117="1.1.7"
cis118="1.1.8"
cis119="1.1.9"
cis1110="1.1.10"
cis11_11="1.1.11"
cis11_12="1.1.12"
cis11_13="1.1.13"
cis11_14="1.1.14"
cis11_15="1.1.15"
cis11_16="1.1.16"
cis11_17="1.1.17"
cis11_18="1.1.18"
cis11_19="1.1.19"
cis11_20="1.1.20"
cis11_21="1.1.21"
cis11_22="1.1.22"
cis121="1.2.1"
cis122="1.2.2"
cis131="1.3.1"
cis132="1.3.2"
cis141="1.4.1"
cis143="1.4.3"
cis151="1.5.1"
cis152="1.5.2"
cis153="1.5.3"
cis154="1.5.4"
cis1611="1.6.1.1"
cis1612="1.6.1.2"
cis1613="1.6.1.3"
cis1614="1.6.1.4"
cis1615="1.6.1.5"
cis1616="1.6.1.6"
cis1621="1.6.2.1"
cis1622="1.6.2.2"
cis163="1.6.3"
cis1711="1.7.1.1"
cis1712="1.7.1.2"
cis1713="1.7.1.3"
cis1714="1.7.1.4"
cis1715="1.7.1.5"
cis1716="1.7.1.6"
cis1717="1.7.1.7"
cis172="1.7.2"
cis18="1.8"
cis211="2.1.1"
cis212="2.1.2"
cis213="2.1.3"
cis214="2.1.4"
cis215="2.1.5"
cis216="2.1.6"
cis217="2.1.7"
cis218="2.1.8"
cis219="2.1.9"
cis2110="2.1.10"
cis2111="2.1.11"
cis2211="2.2.1.1"
cis2212="2.2.1.2"
cis222="2.2.2"
cis223="2.2.3"
cis224="2.2.4"
cis225="2.2.5"
cis226="2.2.6"
cis227="2.2.7"
cis228="2.2.8"
cis229="2.2.9"
cis2_2_10="2.2.10"
cis2_2_11="2.2.11"
cis2_2_12="2.2.12"
cis2_2_13="2.2.13"
cis2_2_14="2.2.14"
cis2_2_15="2.2.15"
cis2_2_16="2.2.16"
cis2_2_17="2.2.17"
cis2_2_18="2.2.18"
cis231="2.3.1"
cis232="2.3.2"
cis233="2.3.3"
cis234="2.3.4"
cis235="2.3.5"
cis311="3.1.1"
cis312="3.1.2"
cis321="3.2.1"
cis322="3.2.2"
cis323="3.2.3"
cis324="3.2.4"
cis325="3.2.5"
cis326="3.2.6"
cis327="3.2.7"
cis328="3.2.8"
cis331="3.3.1"
cis332="3.3.2"
cis333="3.3.3"
cis341="3.4.1"
cis342="3.4.2"
cis343="3.4.3"
cis344="3.4.4"
cis345="3.4.5"
cis351="3.5.1"
cis352="3.5.2"
cis353="3.5.3"
cis354="3.5.4"
cis4_1_1_1="4.1.1.1"
cis412="4.1.2"
cis413="4.1.3"
cis414="4.1.4"
cis415="4.1.5"
cis416="4.1.6"
cis417="4.1.7"
cis418="4.1.8"
cis419="4.1.9"
cis4110="4.1.10"
cis4111="4.1.11"
cis4112="4.1.12"
cis4113="4.1.13"
cis4114="4.1.14"
cis4115="4.1.15"
cis4116="4.1.16"
cis4117="4.1.17"
cis4118="4.1.18"
cis4211="4.2.1.1"
cis4212="4.2.1.2"
cis4213="4.2.1.3"
cis4214="4.2.1.4"
cis4215="4.2.1.5"
cis423="4.2.3"
cis424="4.2.4"
cis43="4.3"
cis511="5.1.1"
cis512="5.1.2"
cis513="5.1.3"
cis514="5.1.4"
cis515="5.1.4"
cis516="5.1.6"
cis516="5.1.6"
cis517="5.1.7"
cis518="5.1.8"
cis521="5.2.1"
cis522="5.2.2"
cis523="5.2.3"
cis524="5.2.4"
cis525="5.2.5"
cis526="5.2.6"
cis527="5.2.7"
cis528="5.2.8"
cis529="5.2.9"
cis5210="5.2.10"
cis5211="5.2.11"
cis5212="5.2.12"
cis5213="5.2.13"
cis5214="5.2.14"
cis5215="5.2.15"


if [[ $(lsmod | grep cramfs) ]]; then
	echo -e "CIS $cis1111 \e[31m\e[1m\e[5mfailed\e[0m cramfs module found"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		if [[ $(rmmod cramfs 2>/dev/null) ]]; then
			echo -e "CIS $cis1111 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		else
			echo -e "CIS $cis1111 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi
else
	echo -e "CIS $cis1111 \e[32m\e[1mpassed\e[0m"
fi
((ccis=ccis+1))

if [[ $(lsmod | grep freevxfs) ]]; then
	echo -e "CIS $cis1112 \e[31m\e[1m\e[5mfailed\e[0m freevxfs module found"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		if [[ $(rmmod freevxfs 2>/dev/null) ]]; then
			echo -e "CIS $cis1112 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		else
			echo -e "CIS $cis1112 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi
else
	echo -e "CIS $cis1112 \e[32m\e[1mpassed\e[0m"
fi
((ccis=ccis+1))

if [[ $(lsmod | grep jffs2) ]]; then
    echo -e "CIS $cis1113 \e[31m\e[1m\e[5mfailed\e[0m jfss2 module found"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		if [[ $(rmmod jffs2 2>/dev/null) ]]; then
			echo -e "CIS $cis1113 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		else
			echo -e "CIS $cis1113 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi
else
    echo -e "CIS $cis1113 \e[32m\e[1mpassed\e[0m"
fi
((ccis=ccis+1))

if [[ $(lsmod | grep hfs) ]]; then
    echo -e "CIS $cis1114 \e[31m\e[1m\e[5mfailed\e[0m hfs module found"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		if [[ $(rmmod hfs 2>/dev/null) ]]; then
			echo -e "CIS $cis1114 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		else
			echo -e "CIS $cis1114 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi
else
    echo -e "CIS $cis1114 \e[32m\e[1mpassed\e[0m"
fi
((ccis=ccis+1))

if [[ $(lsmod | grep hfsplus) ]]; then
    echo -e "CIS $cis1115 \e[31m\e[1m\e[5mfailed\e[0m hfsplus module found"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		if [[ $(rmmod hfsplus 2>/dev/null) ]]; then
			echo -e "CIS $cis1115 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		else
			echo -e "CIS $cis1115 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi
else
    echo -e "CIS $cis1115 \e[32m\e[1mpassed\e[0m"
fi
((ccis=ccis+1))

if [[ $(lsmod | grep squashfs) ]]; then
    echo -e "CIS $cis1116 \e[31m\e[1m\e[5mfailed\e[0m squashfs module found"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		if [[ $(rmmod squashfs 2>/dev/null) ]]; then
			echo -e "CIS $cis1116 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		else
			echo -e "CIS $cis1116 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi
else
    echo -e "CIS $cis1116 \e[32m\e[1mpassed\e[0m"
fi
((ccis=ccis+1))

if [[ $(lsmod | grep udf) ]]; then
    echo -e "CIS $cis1117 \e[31m\e[1m\e[5mfailed\e[0m udf module found"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		if [[ $(rmmod udf 2>/dev/null) ]]; then
			echo -e "CIS $cis1117 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		else
			echo -e "CIS $cis1117 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi
else
    echo -e "CIS $cis1117 \e[32m\e[1mpassed\e[0m"
fi
((ccis=ccis+1))

if [[ $(lsmod | grep vfat) ]]; then
    echo -e "CIS $cis1118 \e[31m\e[1m\e[5mfailed\e[0m vfat module found"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		if [[ $(rmmod vfat 2>/dev/null) ]]; then
			echo -e "CIS $cis1118 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		else
			echo -e "CIS $cis1118 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi
else
    echo -e "CIS $cis1118 \e[32m\e[1mpassed\e[0m"
fi
((ccis=ccis+1))

if [[ $(mount | grep /tmp) ]]; then
	echo -e "CIS $cis112 \e[32m\e[1mpassed\e[0m"
	if [[ $(mount | grep /tmp | grep nodev) ]]; then
		echo -e "CIS $cis113 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis113 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi

	if [[ $(mount | grep /tmp | grep nosuid) ]]; then
		echo -e "CIS $cis114 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis114 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi

	if [[ $(mount | grep /tmp | grep noexec) ]]; then
		echo -e "CIS $cis115 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis115 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi
else
	echo -e "CIS $cis112 \e[31m\e[1m\e[5mfailed\e[0m /tmp must be mounted on a separate partition"
	((cfcis=cfcis+1))
	echo -e "CIS $cis113 \e[31m\e[1m\e[5mfailed\e[0m nodev option must be set on /tmp partition"
	((cfcis=cfcis+1))
	echo -e "CIS $cis114 \e[31m\e[1m\e[5mfailed\e[0m nosuid option must be set on /tmp partition"
	((cfcis=cfcis+1))
	echo -e "CIS $cis115 \e[31m\e[1m\e[5mfailed\e[0m noexec option must be set on /tmp partition"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))
((ccis=ccis+1))
((ccis=ccis+1))
((ccis=ccis+1))

if [[ $(mount | grep "/var ") ]]; then
	echo -e "CIS $cis116 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis116 \e[31m\e[1m\e[5mfailed\e[0m /var must be mounted on a separate partition"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

if [[ $(mount | grep "/var/tmp ") ]]; then
	echo -e "CIS $cis117 \e[32m\e[1mpassed\e[0m"
	if [[ $(mount | grep /var/tmp | grep nodev) ]]; then
		echo -e "CIS $cis118 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis118 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi

	if [[ $(mount | grep /var/tmp | grep nosuid) ]]; then
		echo -e "CIS $cis119 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis119 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi

	if [[ $(mount | grep /var/tmp | grep noexec) ]]; then
		echo -e "CIS $cis1110 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis1110 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi
else
	echo -e "CIS $cis117 \e[31m\e[1m\e[5mfailed\e[0m /var/tmp must be mounted on a separate partition"
	((cfcis=cfcis+1))
	echo -e "CIS $cis118 \e[31m\e[1m\e[5mfailed\e[0m nodev option must be set on /var/tmp partition"
	((cfcis=cfcis+1))
	echo -e "CIS $cis119 \e[31m\e[1m\e[5mfailed\e[0m nosuid option must be set on /var/tmp partition"
	((cfcis=cfcis+1))
	echo -e "CIS $cis1110 \e[31m\e[1m\e[5mfailed\e[0m noexec option must be set on /var/tmp partition"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))
((ccis=ccis+1))
((ccis=ccis+1))
((ccis=ccis+1))

if [[ $(mount | grep "/var/log ") ]]; then
	echo -e "CIS $cis11_11 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis11_11 \e[31m\e[1m\e[5mfailed\e[0m /var/log must be mounted on a separate partition"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

if [[ $(mount | grep "/var/log/audit ") ]]; then
	echo -e "CIS $cis11_12 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis11_12 \e[31m\e[1m\e[5mfailed\e[0m /var/log/audit must be mounted on a separate partition"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

if [[ $(mount | grep "/home ") ]]; then
	echo -e "CIS $cis11_13 \e[32m\e[1mpassed\e[0m"

	if [[ $(mount | grep /home | grep nodev) ]]; then
		echo -e "CIS $cis11_14 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis11_14 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi
else
	echo -e "CIS $cis11_13 \e[31m\e[1m\e[5mfailed\e[0m /home must be mounted on a separate partition"
	echo -e "CIS $cis11_14 \e[31m\e[1m\e[5mfailed\e[0m nodev option must be set on /home partition"
	((cfcis=cfcis+1))
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))
((ccis=ccis+1))

if [[ $(mount | grep "/dev/shm ") ]]; then

	if [[ $(mount | grep /dev/shm | grep nodev) ]]; then
		echo -e "CIS $cis11_15 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis11_15 \e[31m\e[1m\e[5mfailed\e[0m nodev option must be set on /dev/shm partition"
		((cfcis=cfcis+1))
	fi

	if [[ $(mount | grep /dev/shm | grep nosuid) ]]; then
		echo -e "CIS $cis11_16 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis11_16 \e[31m\e[1m\e[5mfailed\e[0m nosuid option must be set on /dev/shm partition"
		((cfcis=cfcis+1))
	fi

	if [[ $(mount | grep /dev/shm | grep noexec) ]]; then
		echo -e "CIS $cis11_17 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis11_17 \e[31m\e[1m\e[5mfailed\e[0m noexec option must be set on /dev/shm partition"
		((cfcis=cfcis+1))
	fi
else
	echo -e "CIS $cis11_15 \e[31m\e[1m\e[5mfailed\e[0m nodev option must be set on /dev/shm partition"
	((cfcis=cfcis+1))
	echo -e "CIS $cis11_16 \e[31m\e[1m\e[5mfailed\e[0m nosuid option must be set on /dev/shm partition"
	((cfcis=cfcis+1))
	echo -e "CIS $cis11_17 \e[31m\e[1m\e[5mfailed\e[0m noexec option must be set on /dev/shm partition"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))
((ccis=ccis+1))
((ccis=ccis+1))

if [[ $(mount | grep nodev | grep cdrom) ]]; then
	echo -e "CIS $cis11_18 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis11_18 Unknown or Not Applicable"
fi

if [[ $(mount | grep nosuid | grep cdrom) ]]; then
        echo -e "CIS $cis11_19 \e[32m\e[1mpassed\e[0m"
else
        echo -e "CIS $cis11_19 Unknown or Not Applicable"
fi

if [[ $(mount | grep noexec | grep cdrom) ]]; then
        echo -e "CIS $cis11_20 \e[32m\e[1mpassed\e[0m"
else
        echo -e "CIS $cis11_20 Unknown or Not Applicable"
fi

resultperm=$(df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a \! -perm -1000 \) 2>/dev/null)

if [[ $resultperm ]]; then
	echo -e "CIS $cis11_21 \e[31m\e[1m\e[5mfailed\e[0m sticky bit is not set on world-writable directories:"
	echo -e $resultperm
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		if [[ $(echo $resultperm | xargs chmod a+t 2>&1) ]]; then
			echo -e "CIS $cis11_21 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		else
			echo -e "CIS $cis11_21 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	else
		echo -e "execute chmod a+t over above directories to resolv the issue"
	fi	
else
	echo -e "CIS $cis11_21 \e[32m\e[1mpassed\e[0m"
fi
((ccis=ccis+1))

automo=$(stat /etc/systemd/system/multi-user.target.wants/autofs.service 2>&1)

if [[ $automo == *"o such file or directory" ]]; then
	echo -e "CIS $cis11_22 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis11_22 \e[31m\e[1m\e[5mfailed\e[0m Automounting is not disabled "
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		systemctl disable autofs
		automo=$(stat /etc/systemd/system/multi-user.target.wants/autofs.service 2>&1)
		if [[ $automo == *"o such file or directory" ]]; then
			echo -e "CIS $cis11_22 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis11_22 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
fi
((ccis=ccis+1))

echo -e "###### Check CIS Controls 1.2 Configure Software Updates ######"

if [[ $(zypper repos | cut -d\| -f 1-4 | grep pdate | grep Yes) ]]; then
	echo -e "CIS $cis121 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis121 \e[31m\e[1m\e[5mfailed\e[0m package manager repositories must be configured"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

if [[ $(rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\n' | grep suse) ]]; then
	echo -e "CIS $cis122 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis122 \e[31m\e[1m\e[5mfailed\e[0m package manager GPG keys need to be updated"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

echo -e "###### Check CIS Controls 1.3 Filesystem Integrity Check ######"

if [[ $(rpm -q aide | grep "is not installed") ]]; then
	echo -e "CIS $cis131 \e[31m\e[1m\e[5mfailed\e[0m AIDE must be installed"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		if [[ $(zypper -n install aide) ]]; then
			echo -e "CIS $cis131 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis131 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
else
	echo -e "CIS $cis131 \e[32m\e[1mpassed\e[0m"
fi
((ccis=ccis+1))

if [[ $(grep -r aide /etc/cron.* /etc/crontab) ]]; then
	echo -e "CIS $cis132 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis132 \e[31m\e[1m\e[5mfailed\e[0m filesystem integrity must be checked regularly "
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

echo -e "###### Check CIS Controls 1.4 Secure Boot Settings ######"

if [[ $(stat /boot/grub2/grub.cfg | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0600/-rw-------)") ]]; then
	echo -e "CIS $cis141 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis141 \e[31m\e[1m\e[5mfailed\e[0m risky permissions detected on bootloader config /boot/grub2/grub.cfg"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		chown root:root /boot/grub2/grub.cfg
		chmod 600 /boot/grub2/grub.cfg

		if [[ $(stat /boot/grub2/grub.cfg | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0600/-rw-------)") ]]; then
			echo -e "CIS $cis141 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis141 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
fi
((ccis=ccis+1))

# CIS 1.4.2 bootloader password not applicable

if [[ $(grep /sbin/sulogin /usr/lib/systemd/system/rescue.service | grep sulogin) ]]; then
	if [[ $(grep /sbin/sulogin /usr/lib/systemd/system/emergency.service | grep sulogin) ]]; then
		echo -e "CIS $cis143 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis143 \e[31m\e[1m\e[5mfailed\e[0m Authentication must be required for single user mode [file emergency.service 2 of 2]"
		if [[ $1 == "R" ]]; then
			if [[ $(cat /usr/lib/systemd/system/rescue.service | grep "ExecStart=" | wc | awk '{ if ($1==1) print $1}') ]]; then
				cp -rf /usr/lib/systemd/system/emergency.service /usr/lib/systemd/system/emergency.service.cis
				sed -i 's/ExecStart=.*/ExecStart=-\/bin\/sh -c "\/usr\/sbin\/sulogin; \/usr\/bin\/systemctl --job-mode=fail --no-block default"/' /usr/lib/systemd/system/emergency.service
				if [[ $(grep /sbin/sulogin /usr/lib/systemd/system/emergency.service | grep sulogin) ]]; then
					echo -e "CIS $cis143 remediation \e[32m\e[1msuccesful\e[0m [file emergency.service 2 of 2]"
				else
					echo -e "CIS $cis143 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually [file emergency.service 2 of 2]"
				fi
			else
				echo -e "CIS $cis143 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually [file emergency.service 2 of 2]"
			fi
		fi
		((cfcis=cfcis+1))
	fi
else
	echo -e "CIS $cis143 \e[31m\e[1m\e[5mfailed\e[0m Authentication must be required for single user mode [file rescue.service 1 of 2]"
	((cfcis=cfcis+1))

	if [[ $1 == "R" ]]; then
		if [[ $(cat /usr/lib/systemd/system/rescue.service | grep "ExecStart=" | wc | awk '{ if ($1==1) print $1}') ]]; then
			cp -rf /usr/lib/systemd/system/rescue.service /usr/lib/systemd/system/rescue.service.cis
			sed -i 's/ExecStart=.*/ExecStart=-\/bin\/sh -c "\/usr\/sbin\/sulogin; \/usr\/bin\/systemctl --job-mode=fail --no-block default"/' /usr/lib/systemd/system/rescue.service
			if [[ $(grep /sbin/sulogin /usr/lib/systemd/system/rescue.service | grep sulogin) ]]; then
				echo -e "CIS $cis143 remediation \e[32m\e[1msuccesful\e[0m [file rescue.service 1 of 2]"
			else
				echo -e "CIS $cis143 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually [file rescue.service 1 of 2]"
			fi
		else
			echo -e "CIS $cis143 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually [file rescue.service 1 of 2]"
		fi
	fi
fi
((ccis=ccis+1))

echo -e "###### Check CIS Controls 1.5 Additional Process Hardening ######"

if [[ $(grep "hard core" /etc/security/limits.conf) ]]; then
	if [[ $(sysctl fs.suid_dumpable | grep "fs.suid_dumpable = 0") ]]; then
		if [[ $(grep "fs.suid_dumpable" /etc/sysctl.conf | grep "fs.suid_dumpable = 0") ]]; then
			echo -e "CIS $cis151 \e[32m\e[1mpassed\e[0m"
		else
			((cfcis=cfcis+1))
			echo -e "CIS $cis151 \e[31m\e[1m\e[5mfailed\e[0m.  Check manually [file sysctl.conf 3 of 3]"
			if [[ $1 == "R" ]]; then
				echo "fs.suid_dumpable = 0" >> /etc/sysctl.conf
				sysctl -w fs.suid_dumpable=0
				if [[ $(grep "fs.suid_dumpable" /etc/sysctl.conf | grep "fs.suid_dumpable = 0") ]]; then
					echo -e "CIS $cis151 remediation \e[32m\e[1msuccesful\e[0m [file sysctl.conf 3 of 3]"
				else
					echo -e "CIS $cis151 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually [file sysctl.conf 3 of 3]"
				fi
			fi
		fi
	else
		echo -e "CIS $cis151 \e[31m\e[1m\e[5mfailed\e[0m [file systcl.conf 2 of 2]"
		((cfcis=cfcis+1))
		if [[ $1 == "R" ]]; then
			echo "fs.suid_dumpable = 0" >> /etc/sysctl.conf
			sysctl -w fs.suid_dumpable=0
			if [[ $(grep "fs.suid_dumpable" /etc/sysctl.conf | grep "fs.suid_dumpable = 0") ]]; then
				echo -e "CIS $cis151 remediation \e[32m\e[1msuccesful\e[0m [file limits.conf 2 of 3]"
			else
				echo -e "CIS $cis151 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually [file sysctl.conf 2 of 3]"
			fi
		fi
	fi
else
	echo -e "CIS $cis151 \e[31m\e[1m\e[5mfailed\e[0m Core dumps are restricted [file limits.conf 1 of 3]"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		echo "* hard core 0" >> /etc/security/limits.conf
		if [[ $(grep "hard core" /etc/security/limits.conf) ]]; then
			echo -e "CIS $cis151 remediation \e[32m\e[1msuccesful\e[0m [file limits.conf 1 of 3]"
		else
			echo -e "CIS $cis151 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually [file limits.conf 1 of 3]"
		fi
	fi
fi 
((ccis=ccis+1))

if [[ $(dmesg | grep NX | grep active) ]]; then
	echo -e "CIS $cis152 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis152 \e[31m\e[1m\e[5mfailed\e[0m XD/NX support must be enabled"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

if [[ $(sysctl kernel.randomize_va_space | grep "kernel.randomize_va_space = 2") ]]; then
	if [[ $(grep "kernel.randomize_va_space" /etc/sysctl.conf | grep kernel.randomize_va_space) ]]; then
		echo -e "CIS $cis153 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis153 \e[31m\e[1m\e[5mfailed\e[0m Address space layout randomization (ASLR) must be enabled"
		((cfcis=cfcis+1))
		if [[ $1 == "R" ]]; then
			echo "kernel.randomize_va_space = 2" >> /etc/sysctl.conf
			sysctl -w kernel.randomize_va_space=2
			
			if [[ $(grep "kernel.randomize_va_space" /etc/sysctl.conf | grep kernel.randomize_va_space) ]]; then
				echo -e "CIS $cis153 remediation \e[32m\e[1msuccesful\e[0m"
			else
				echo -e "CIS $cis153 \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		fi
	fi
else
	echo -e "CIS $cis153 \e[31m\e[1m\e[5mfailed\e[0m Address space layout randomization (ASLR) must be enabled"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

if [[ $(rpm -q prelink | grep "is not installed") ]]; then
	echo -e "CIS $cis154 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis154 \e[31m\e[1m\e[5mfailed\e[0m prelink must be disabled"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		prelink -ua
		if [[ $(zypper -n remove prelink) ]]; then
			echo -e "CIS $cis154 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis154 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi
fi
((ccis=ccis+1))

echo -e "###### Check CIS Controls 1.6 Mandatory Access Control ######"

if [[ $(grep "^\s*linux" /boot/grub2/grub.cfg | grep "selinux=1") ]]; then
	echo -e "CIS $cis1611 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis1611 \e[31m\e[1m\e[5mfailed\e[0m SELinux is disabled in bootloader configuration"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=".*/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/' /etc/default/grub
		sed -i 's/GRUB_CMDLINE_LINUX=.*/GRUB_CMDLINE_LINUX="security=selinux selinux=1"/' /etc/default/grub
		grub2-mkconfig > /boot/grub2/grub.cfg
		if [[ $(grep "^\s*linux" /boot/grub2/grub.cfg | grep "selinux=1") ]]; then
			echo -e "CIS $cis1611 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis1611 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi
fi
((ccis=ccis+1))

# CIS 1.6.1.2 SELinux state is enforcing / permissive
# SELinux only if Apparmar is not in use

if [[ $(grep "^SELINUX=permissive" /etc/selinux/config) ]]; then
	echo -e "CIS $cis1612 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis1612 \e[31m\e[1m\e[5mfailed\e[0m SELinux state must be permissive"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		sed -i 's/SELINUX=.*/SELINUX=permissive/' /etc/selinux/config
		if [[ $(grep "^SELINUX=permissive" /etc/selinux/config) ]]; then
			echo -e "CIS $cis1612 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis1612 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi
fi
((ccis=ccis+1))

if [[ $(grep "^SELINUXTYPE=targeted" /etc/selinux/config) ]]; then
    echo -e "CIS $cis1613 \e[32m\e[1mpassed\e[0m"
else
    echo -e "CIS $cis1613 \e[31m\e[1m\e[5mfailed\e[0m SELinux policy must be configured"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		sed -i 's/SELINUXTYPE=.*/SELINUXTYPE=targeted/' /etc/selinux/config
		if [[ $(grep "^SELINUXTYPE=targeted" /etc/selinux/config) ]]; then
			echo -e "CIS $cis1613 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis1613 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi
fi
((ccis=ccis+1))

if [[ $(rpm -q setroubleshoot | grep "is not installed") ]]; then
	echo -e "CIS $cis1614 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis1614 \e[31m\e[1m\e[5mfailed\e[0m SETroubleshoot must be disabled"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		if [[ $(zypper -n remove setroubleshoot) ]]; then
			echo -e "CIS $cis1614 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis1614 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi
fi
((ccis=ccis+1))

if [[ $(rpm -q mcstrans | grep "is not installed") ]]; then
    echo -e "CIS $cis1615 \e[32m\e[1mpassed\e[0m"
else
    echo -e "CIS $cis1615 \e[31m\e[1m\e[5mfailed\e[0m MCS Translation Service (mcstrans) must be disabled"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		if [[ $(zypper -n remove mcstrans) ]]; then
			echo -e "CIS $cis1615 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis1615 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi
fi
((ccis=ccis+1))

if [[ $(ps -eZ | egrep "initrc" | egrep -vw "tr | ps | egrep | bash | awk" | tr ':' ' ' | awk '{ print $NF }') ]]; then
	echo -e "CIS $cis1616 \e[31m\e[1m\e[5mfailed\e[0m Unconfined daemons exist"
	((cfcis=cfcis+1))
else
	echo -e "CIS $cis1616 \e[32m\e[1mpassed\e[0m"
fi
((ccis=ccis+1))

if [[ $(grep "^\s*linux" /boot/grub2/grub.cfg | grep "apparmor=0") ]]; then
    echo -e "CIS $cis1621 \e[31m\e[1m\e[5mfailed\e[0m Apparmor is disabled in bootloader configuration"
	((cfcis=cfcis+1))
	if [[ $1 == "T" ]]; then
		sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT=".*/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/' /etc/default/grub
		sed -i 's/GRUB_CMDLINE_LINUX=.*/GRUB_CMDLINE_LINUX="security=apparmor"/' /etc/default/grub
		grub2-mkconfig > /boot/grub2/grub.cfg
		if [[ $(grep "^\s*linux" /boot/grub2/grub.cfg | grep "apparmor=1") ]]; then
			echo -e "CIS $cis1621 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis1621 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi
else
    echo -e "CIS $cis1621 \e[32m\e[1mpassed\e[0m"
fi
((ccis=ccis+1))

# Apparmor only if SELinux is not in use

if [[ $(apparmor status | grep "profiles are loaded") ]]; then
	if [[ $(apparmor status | grep "0 profiles are in complain mode") ]]; then
		if [[ $(apparmor status | grep "0 process are unconfined") ]]; then
			echo -e "CIS $cis1622 \e[32m\e[1mpassed\e[0m"
		else
			echo -e "CIS $cis1622 \e[31m\e[1m\e[5mfailed\e[0m"
			((cfcis=cfcis+1))
		fi
	else
		echo -e "CIS $cis1622 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi
else
	echo -e "CIS $cis1622 \e[31m\e[1m\e[5mfailed\e[0m"
fi
((ccis=ccis+1))

if [[ $(rpm -q libselinux1 selinux-policy | grep "is not installed") ]]; then
	if [[ $(rpm -q libapparmor1 apparmor-utils | grep "is not installed") ]]; then
        echo -e "CIS $cis163 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	else
		echo -e "CIS $cis163 \e[32m\e[1mpassed\e[0m"
	fi
else
    echo -e "CIS $cis163 \e[32m\e[1mpassed\e[0m"
fi
((ccis=ccis+1))

echo -e "###### Check CIS Controls 1.7 Warning Banners ######"

if [[ $(cat /etc/motd | grep "Have a lot of fun") ]]; then
	echo -e "CIS $cis1711 \e[31m\e[1m\e[5mfailed\e[0m"
else
	echo -e "CIS $cis1711 \e[32m\e[1mpassed\e[0m"
fi

if [[ $(cat /etc/issue | grep "Welcome to") ]]; then
        echo -e "CIS $cis1712 \e[31m\e[1m\e[5mfailed\e[0m"
else
	if [[ $(egrep '(\\v|\\r|\\m|\\s)' /etc/issue) ]]; then
		echo -e "CIS $cis1712 \e[31m\e[1m\e[5mfailed\e[0m"
	else
        	echo -e "CIS $cis1712 \e[32m\e[1mpassed\e[0m"
	fi
fi

if [[ $(cat /etc/issue.net | grep "Welcome to") ]]; then
        echo -e "CIS $cis1713 \e[31m\e[1m\e[5mfailed\e[0m"
else
        if [[ $(egrep '(\\v|\\r|\\m|\\s)' /etc/issue) ]]; then
                echo -e "CIS $cis1713 \e[31m\e[1m\e[5mfailed\e[0m"
        else
                echo -e "CIS $cis1713 \e[32m\e[1mpassed\e[0m"
        fi
fi

if [[ $(stat /etc/motd | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0644") ]]; then
        echo -e "CIS $cis1714 \e[32m\e[1mpassed\e[0m"
else
        echo -e "CIS $cis1714 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(stat /etc/issue | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0644") ]]; then
        echo -e "CIS $cis1715 \e[32m\e[1mpassed\e[0m"
else
        echo -e "CIS $cis1715 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(stat /etc/issue.net | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0644") ]]; then
        echo -e "CIS $cis1716 \e[32m\e[1mpassed\e[0m"
else
        echo -e "CIS $cis1716 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(cat /etc/dconf/profile/gdm | grep "user-db:user") ]]; then
	if [[ $(cat /etc/dconf/profile/gdm | grep "system-db:gdm") ]]; then
		if [[ $(cat /etc/dconf/profile/gdm | grep "file-db:") ]]; then
			if [[ $(cat /etc/dconf/db/gdm.d/0* | grep banner-message-enable) ]]; then
				echo -e "CIS $cis172 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis172 \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		else
			echo -e "CIS $cis172 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis172 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	echo -e "CIS $cis172 \e[31m\e[1m\e[5mfailed\e[0m"
fi

z=$((ccis-cfcis))
per=$(echo "scale=3 ; 100*$z/$ccis" | bc -l)

echo "Failed Controls $cfcis"
echo "Total Controls $ccis"
echo "Compliance Percent: $per %"


echo -e "###### Check CIS Controls 1.8 Software Updates ######"

if [[ $(zypper -n list-updates | grep "Available Version") ]]; then
	echo -e "CIS $cis18 \e[31m\e[1m\e[5mfailed\e[0m"
else
	echo -e "CIS $cis18 \e[32m\e[1mpassed\e[0m"
fi

echo -e "###### Check CIS Controls 2.1 inetd services ######"

if [[ $(chkconfig --list | grep chargen | grep off | grep chargen-udp | grep off) ]]; then
	echo -e "CIS $cis211 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis211 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(chkconfig --list | grep daytime | grep off | grep daytime-udp | grep off) ]]; then
	echo -e "CIS $cis212 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis212 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(chkconfig --list | grep discard | grep off | grep discard-udp | grep off) ]]; then
	echo -e "CIS $cis213 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis213 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(chkconfig --list | grep echo | grep off | grep echo-udp | grep off) ]]; then
	echo -e "CIS $cis214 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis214 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(chkconfig --list | grep time | grep off | grep time-udp | grep off) ]]; then
	echo -e "CIS $cis215 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis215 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(chkconfig --list | grep time | grep off | grep time-udp | grep off) ]]; then
	echo -e "CIS $cis215 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis215 \e[31m\e[1m\e[5mfailed\e[0m"
fi

rbsd=$(chkconfig --list | grep rexec | grep rlogin | grep rsh)

if [[ $rbsd == *"on"* ]]; then
	echo -e "CIS $cis216 \e[31m\e[1m\e[5mfailed\e[0m"
else
	echo -e "CIS $cis216 \e[32m\e[1mpassed\e[0m"
fi

talk=$(chkconfig --list | grep talk | grep off)

if [[ $talk == *"on"* ]]; then
	echo -e "CIS $cis217 \e[31m\e[1m\e[5mfailed\e[0m"
else
	echo -e "CIS $cis217 \e[32m\e[1mpassed\e[0m"
fi

telnet=$(chkconfig --list | grep telnet | grep off)

if [[ $telnet == *"on"* ]]; then
	echo -e "CIS $cis218 \e[31m\e[1m\e[5mfailed\e[0m"
else
	echo -e "CIS $cis218 \e[32m\e[1mpassed\e[0m"
fi

tftp=$(chkconfig --list | grep tftp | grep off)

if [[ $tftp == *"on"* ]]; then
	echo -e "CIS $cis219 \e[31m\e[1m\e[5mfailed\e[0m"
else
	echo -e "CIS $cis219 \e[32m\e[1mpassed\e[0m"
fi

rsync=$(chkconfig --list | grep rsync | grep off)

if [[ $rsync == *"on"* ]]; then
	echo -e "CIS $cis2110 \e[31m\e[1m\e[5mfailed\e[0m"
else
	echo -e "CIS $cis2110 \e[32m\e[1mpassed\e[0m"
fi

xinetd=$(systemctl is-enabled xinetd 2>&1)

if [[ $xinetd == *"disabled"* ]]; then
	echo -e "CIS $cis2111 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis2111 \e[31m\e[1m\e[5mfailed\e[0m"
	echo -e $xinetd
fi

echo -e "###### Check CIS Controls 2.2 special purpose services ######"

if [[ $(rpm -q ntp) ]]; then
	echo -e "CIS $cis2211 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis2211 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep "^restrict" /etc/ntp.conf) ]]; then
	if [[ $(grep "^(server|pool)" /etc/ntp.conf) ]]; then
		if [[ $(grep "^NTPD_OPTIONS" /etc/sysconfig/ntp | grep "u ntp:ntp") ]]; then
			echo -e "CIS $cis2212 \e[32m\e[1mpassed\e[0m"
		else
			echo -e "CIS $cis2212 \e[31m\e[1m\e[5mfailed\e[0m"
		fi	
	else
		echo -e "CIS $cis2212 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	echo -e "CIS $cis2212 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(rpm -qa xorg-x11* | grep "is not installed") ]]; then
	echo -e "CIS $cis222 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis222 \e[31m\e[1m\e[5mfailed\e[0m"
fi

avahi=$(systemctl is-enabled avahi-daemon 2>&1)

if [[ $avahi == *"disabled"* ]]; then
	echo -e "CIS $cis223 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis223 \e[31m\e[1m\e[5mfailed\e[0m"
	echo -e $avahi
fi

cups=$(systemctl is-enabled cups 2>&1)

if [[ $cups == *"disabled"* ]]; then
	echo -e "CIS $cis224 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis224 \e[31m\e[1m\e[5mfailed\e[0m"
	echo -e $cups
fi

dhcp=$(systemctl is-enabled dhcpd 2>&1)

if [[ $dhcp == *"disabled"* ]]; then
	echo -e "CIS $cis225 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis225 \e[31m\e[1m\e[5mfailed\e[0m"
	echo -e $dhcp
fi

ldap=$(systemctl is-enabled slapd 2>&1)

if [[ $ldap == *"disabled"* ]]; then
	echo -e "CIS $cis226 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis226 \e[31m\e[1m\e[5mfailed\e[0m"
	echo -e $ldap
fi

nfs=$(systemctl is-enabled nfs 2>&1)

if [[ $nfs == *"disabled"* ]]; then
	rpc=$(systemctl is-enabled rpcbind 2>&1)
	if [[$rpc == *"disabled" ]]; then
		echo -e "CIS $cis227 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis227 \e[31m\e[1m\e[5mfailed\e[0m"
		echo -e $nfs
		echo -e $rpc
	fi
else
	echo -e "CIS $cis227 \e[31m\e[1m\e[5mfailed\e[0m"
	echo -e $nfs
	echo -e $rpc
fi

named=$(systemctl is-enabled named 2>&1)

if [[ $named == *"disabled"* ]]; then
	echo -e "CIS $cis228 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis228 \e[31m\e[1m\e[5mfailed\e[0m"
	echo -e $named
fi

vsftp=$(systemctl is-enabled vsftpd 2>&1)

if [[ $vsftp == *"disabled"* ]]; then
	echo -e "CIS $cis229 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis229 \e[31m\e[1m\e[5mfailed\e[0m"
	echo -e $vsftp
fi

http=$(systemctl is-enabled apache2 2>&1)

if [[ $http == *"disabled"* ]]; then
	echo -e "CIS $cis2_2_10 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis2_2_10 \e[31m\e[1m\e[5mfailed\e[0m"
	echo -e $http
fi

mta=$(systemctl is-enabled dovecot 2>&1)

if [[ $mta == *"disabled"* ]]; then
	echo -e "CIS $cis2_2_11 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis2_2_11 \e[31m\e[1m\e[5mfailed\e[0m"
	echo -e $mta
fi

smb=$(systemctl is-enabled smb 2>&1)

if [[ $smb == *"disabled"* ]]; then
	echo -e "CIS $cis2_2_12 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis2_2_12 \e[31m\e[1m\e[5mfailed\e[0m"
	echo -e $smb
fi

prox=$(systemctl is-enabled squid 2>&1)

if [[ $prox == *"disabled"* ]]; then
	echo -e "CIS $cis2_2_13 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis2_2_13 \e[31m\e[1m\e[5mfailed\e[0m"
	echo -e $prox
fi

snmp=$(systemctl is-enabled snmpd 2>&1)

if [[ $snmp == *"disabled"* ]]; then
	echo -e "CIS $cis2_2_14 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis2_2_14 \e[31m\e[1m\e[5mfailed\e[0m"
	echo -e $snmp
fi

if [[ $(netstat -an | grep LISTEN | grep ":25[[:space:]]" | grep "127.0.0.1:25" | grep "0.0.0.0:\*") ]]; then
	echo -e "CIS $cis2_2_15 \e[31m\e[1m\e[5mfailed\e[0m"
else
	echo -e "CIS $cis2_2_15 \e[32m\e[1mpassed\e[0m"
fi

nis=$(systemctl is-enabled ypserver 2>&1)

if [[ $nis == *"disabled"* ]]; then
	echo -e "CIS $cis2_2_16 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis2_2_16 \e[31m\e[1m\e[5mfailed\e[0m"
	echo -e $snmp
fi

atftp=$(systemctl is-enabled atftpd 2>&1)

if [[ $atftp == *"disabled"* ]]; then
	echo -e "CIS $cis2_2_17 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis2_2_17 \e[31m\e[1m\e[5mfailed\e[0m"
	echo -e $atftp
fi

rs=$(systemctl is-enabled rsyncd 2>&1)

if [[ $rs == *"disabled"* ]]; then
	echo -e "CIS $cis2_2_18 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis2_2_18 \e[31m\e[1m\e[5mfailed\e[0m"
	echo -e $rs
fi

echo -e "###### Check CIS Controls 2.3 service clients ######"

if [[ $(rpm -q ypbind | grep "is not installed") ]]; then
	echo -e "CIS $cis231 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis231 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(rpm -q rsh | grep "is not installed") ]]; then
	echo -e "CIS $cis232 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis232 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(rpm -q talk | grep "is not installed") ]]; then
	echo -e "CIS $cis233 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis233 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(rpm -q telnet | grep "is not installed") ]]; then
	echo -e "CIS $cis234 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis234 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(rpm -q telnet | grep "is not installed") ]]; then
	echo -e "CIS $cis235 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis235 \e[31m\e[1m\e[5mfailed\e[0m"
fi

echo -e "###### Check CIS Controls 3.1 Host Network Parameters ######"

if [[ $(sysctl net.ipv4.ip_forward | grep "ip_forward = 0") ]]; then
	if [[ $(grep "net.ipv4.ip_forward = 0" /etc/sysctl.conf) ]]; then
		echo -e "CIS $cis311 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis311 \e[31m\e[1m\e[5mfailed\e[0m"
	fi	
else
	echo -e "CIS $cis311 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(sysctl net.ipv4.conf.all.send_redirects | grep "send_redirects = 0") ]]; then
	if [[ $(grep "net.ipv4.conf.all.send_redirects = 0" /etc/sysctl.conf) ]]; then
		if [[ $(sysctl net.ipv4.conf.default.send_redirects | grep "send_redirects = 0") ]]; then
			if [[ $(grep "net.ipv4.conf.all.send_redirects = 0" /etc/sysctl.conf) ]]; then
				echo -e "CIS $cis312 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis312 \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		else
			echo -e "CIS $cis312 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis312 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	echo -e "CIS $cis312 \e[31m\e[1m\e[5mfailed\e[0m"
fi

echo -e "###### Check CIS Controls 3.2 Host and Router Network Parameters ######"

if [[ $(sysctl net.ipv4.conf.all.accept_source_route | grep "accept_source_route = 0") ]]; then
	if [[ $(grep "net.ipv4.conf.all.accept_source_route = 0" /etc/sysctl.conf) ]]; then
		if [[ $(sysctl net.ipv4.conf.default.accept_source_route | grep "accept_source_route = 0") ]]; then
			if [[ $(grep "net.ipv4.conf.default.accept_source_route = 0" /etc/sysctl.conf) ]]; then
				echo -e "CIS $cis321 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis321 \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		else
			echo -e "CIS $cis321 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis321 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	echo -e "CIS $cis321 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(sysctl net.ipv4.conf.all.accept_redirects | grep "accept_redirects = 0") ]]; then
	if [[ $(grep "net.ipv4.conf.all.accept_redirects = 0" /etc/sysctl.conf) ]]; then
		if [[ $(sysctl net.ipv4.conf.default.accept_redirects | grep "accept_redirects = 0") ]]; then
			if [[ $(grep "net.ipv4.conf.default.accept_redirects = 0" /etc/sysctl.conf) ]]; then
				echo -e "CIS $cis322 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis322 \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		else
			echo -e "CIS $cis322 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis322 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	echo -e "CIS $cis322 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(sysctl net.ipv4.conf.all.secure_redirects | grep "secure_redirects = 0") ]]; then
	if [[ $(grep "net.ipv4.conf.all.secure_redirects = 0" /etc/sysctl.conf) ]]; then
		if [[ $(sysctl net.ipv4.conf.default.secure_redirects | grep "secure_redirects = 0") ]]; then
			if [[ $(grep "net.ipv4.conf.default.secure_redirects = 0" /etc/sysctl.conf) ]]; then
				echo -e "CIS $cis323 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis323 \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		else
			echo -e "CIS $cis323 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis323 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	echo -e "CIS $cis323 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(sysctl net.ipv4.conf.all.secure_redirects | grep "secure_redirects = 0") ]]; then
	if [[ $(grep "net.ipv4.conf.all.secure_redirects = 0" /etc/sysctl.conf) ]]; then
		if [[ $(sysctl net.ipv4.conf.default.secure_redirects | grep "secure_redirects = 0") ]]; then
			if [[ $(grep "net.ipv4.conf.default.secure_redirects = 0" /etc/sysctl.conf) ]]; then
				echo -e "CIS $cis323 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis323 \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		else
			echo -e "CIS $cis323 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis323 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	echo -e "CIS $cis323 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(sysctl net.ipv4.conf.all.log_martians | grep "log_martians = 1") ]]; then
	if [[ $(grep "net.ipv4.conf.all.log_martians = 1" /etc/sysctl.conf) ]]; then
		if [[ $(sysctl net.ipv4.conf.default.log_martians | grep "log_martians = 1") ]]; then
			if [[ $(grep "net.ipv4.conf.default.log_martians = 1" /etc/sysctl.conf) ]]; then
				echo -e "CIS $cis324 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis324 \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		else
			echo -e "CIS $cis324 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis324 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	echo -e "CIS $cis324 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(sysctl net.ipv4.icmp_echo_ignore_broadcasts | grep "icmp_echo_ignore_broadcasts = 1") ]]; then
	if [[ $(grep "icmp_echo_ignore_broadcasts = 1" /etc/sysctl.conf) ]]; then
		echo -e "CIS $cis325 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis325 \e[31m\e[1m\e[5mfailed\e[0m"
	fi	
else
	echo -e "CIS $cis325 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(sysctl net.ipv4.icmp_ignore_bogus_error_responses | grep "icmp_ignore_bogus_error_responses = 1") ]]; then
	if [[ $(grep "icmp_ignore_bogus_error_responses = 1" /etc/sysctl.conf) ]]; then
		echo -e "CIS $cis326 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis326 \e[31m\e[1m\e[5mfailed\e[0m"
	fi	
else
	echo -e "CIS $cis326 \e[31m\e[1m\e[5mfailed\e[0m"
fi


if [[ $(sysctl net.ipv4.conf.all.rp_filter | grep "rp_filter = 1") ]]; then
	if [[ $(grep "net.ipv4.conf.all.rp_filter = 1" /etc/sysctl.conf) ]]; then
		if [[ $(sysctl net.ipv4.conf.default.rp_filter | grep "rp_filter = 1") ]]; then
			if [[ $(grep "net.ipv4.conf.default.rp_filter = 1" /etc/sysctl.conf) ]]; then
				echo -e "CIS $cis327 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis327 \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		else
			echo -e "CIS $cis327 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis327 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	echo -e "CIS $cis327 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(sysctl net.ipv4.tcp_syncookies | grep "tcp_syncookies = 1") ]]; then
	if [[ $(grep "tcp_syncookies = 1" /etc/sysctl.conf) ]]; then
		echo -e "CIS $cis328 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis328 \e[31m\e[1m\e[5mfailed\e[0m"
	fi	
else
	echo -e "CIS $cis328 \e[31m\e[1m\e[5mfailed\e[0m"
fi

echo -e "###### Check CIS Controls 3.3 IPv6 ######"

if [[ $(sysctl net.ipv6.conf.all.accept_ra | grep "accept_ra = 0") ]]; then
	if [[ $(grep "net.ipv6.conf.all.accept_ra = 0" /etc/sysctl.conf) ]]; then
		if [[ $(sysctl net.ipv6.conf.default.accept_ra | grep "accept_ra = 0") ]]; then
			if [[ $(grep "net.ipv6.conf.default.accept_ra = 0" /etc/sysctl.conf) ]]; then
				echo -e "CIS $cis331 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis331 \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		else
			echo -e "CIS $cis331 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis331 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	echo -e "CIS $cis331 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(sysctl net.ipv6.conf.all.accept_redirects | grep "accept_redirects = 0") ]]; then
	if [[ $(grep "net.ipv6.conf.all.accept_redirects = 0" /etc/sysctl.conf) ]]; then
		if [[ $(sysctl net.ipv6.conf.default.accept_redirects | grep "accept_redirects = 0") ]]; then
			if [[ $(grep "net.ipv6.conf.default.accept_redirects = 0" /etc/sysctl.conf) ]]; then
				echo -e "CIS $cis332 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis332 \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		else
			echo -e "CIS $cis332 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis332 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	echo -e "CIS $cis332 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep "^\s*linux" /boot/grub2/grub.cfg | grep "ipv6.disable") ]]; then
	echo -e "CIS $cis333 \e[31m\e[1m\e[5mfailed\e[0m"
else
	echo -e "CIS $cis333 \e[32m\e[1mpassed\e[0m"
fi

echo -e "###### Check CIS Controls 3.4 TCP Wrappers ######"

if [[ $(rpm -q tcpd | grep "is not installed") ]]; then
	echo -e "CIS $cis341 \e[31m\e[1m\e[5mfailed\e[0m"
else
	echo -e "CIS $cis341 \e[32m\e[1mpassed\e[0m"
fi

if [[ $(stat /etc/hosts.allow | grep "No such file or director") ]]; then
	echo -e "CIS $cis342 \e[31m\e[1m\e[5mfailed\e[0m"
else
	echo -e "CIS $cis342 \e[32m\e[1mpassed\e[0m"
fi

if [[ $(cat /etc/hosts.deny | grep "ALL:ALL") ]]; then
	echo -e "CIS $cis343 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis343 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(stat /etc/hosts.allow | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0644") ]]; then
        echo -e "CIS $cis344 \e[32m\e[1mpassed\e[0m"
else
        echo -e "CIS $cis344 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(stat /etc/hosts.deny | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0644") ]]; then
        echo -e "CIS $cis345 \e[32m\e[1mpassed\e[0m"
else
        echo -e "CIS $cis345 \e[31m\e[1m\e[5mfailed\e[0m"
fi

echo -e "###### Check CIS Controls 3.5 Uncommon Network Protocols ######"

if [[ $(lsmod | grep dccp) ]]; then
        echo -e "CIS $cis351 \e[31m\e[1m\e[5mfailed\e[0m"
else
        echo -e "CIS $cis351 \e[32m\e[1mpassed\e[0m"
fi

if [[ $(lsmod | grep sctp) ]]; then
        echo -e "CIS $cis352 \e[31m\e[1m\e[5mfailed\e[0m"
else
        echo -e "CIS $cis352 \e[32m\e[1mpassed\e[0m"
fi

if [[ $(lsmod | grep rds) ]]; then
        echo -e "CIS $cis353 \e[31m\e[1m\e[5mfailed\e[0m"
else
        echo -e "CIS $cis353 \e[32m\e[1mpassed\e[0m"
fi

if [[ $(lsmod | grep tipc) ]]; then
        echo -e "CIS $cis354 \e[31m\e[1m\e[5mfailed\e[0m"
else
        echo -e "CIS $cis354 \e[32m\e[1mpassed\e[0m"
fi

echo -e "###### Check CIS Controls 4.1 Configure System Accounting (auditd) ######"

if [[ $(grep max_log_file /etc/audit/auditd.conf 2>/dev/null) ]]; then
        echo -e "CIS $cis4_1_1_1 \e[32m\e[1mpassed\e[0m"
else
        echo -e "CIS $cis4_1_1_1 \e[31m\e[1m\e[5mfailed\e[0m"
fi

auditd=$(systemctl is-enabled auditd 2>/dev/null)

if [[ $auditd == *"enabled"* ]]; then
	echo -e "CIS $cis412 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis412 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep "^\s*linux" /boot/grub2/grub.cfg | grep "audit") ]]; then
	echo -e "CIS $cis413 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis413 \e[31m\e[1m\e[5mfailed\e[0m"
fi

archi=$(uname -m)

if [[ $archi == *"64"* ]]; then
	if [[ $(grep time-change /etc/audit/audit.rules 2>/dev/null | grep b64 | grep always | grep adjtimex | grep settimeofday | grep stime) ]]; then
		if [[ $(grep clock_settime /etc/audit/audit.rules 2>/dev/null | grep b64 | grep clock) ]]; then
			echo -e "CIS $cis414 \e[32m\e[1mpassed\e[0m"
		else
			echo -e "CIS $cis414 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis414 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	if [[ $(grep time-change /etc/audit/audit.rules 2>/dev/null | grep b32 | grep always | grep adjtimex | grep settimeofday | grep stime) ]]; then
		if [[ $(grep clock_settime /etc/audit/audit.rules 2>/dev/null | grep b32 | grep clock) ]]; then
			echo -e "CIS $cis414 \e[32m\e[1mpassed\e[0m"
		else
			echo -e "CIS $cis414 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis414 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
fi

if [[ $(grep identity /etc/audit/audit.rules 2>/dev/null | grep identity | grep group) ]]; then
	if [[ $(grep identity /etc/audit/audit.rules 2>/dev/null | grep identity | grep passwd) ]]; then
		if [[ $(grep identity /etc/audit/audit.rules 2>/dev/null | grep identity | grep shadow) ]]; then
			echo -e "CIS $cis415 \e[32m\e[1mpassed\e[0m"
		else
			echo -e "CIS $cis415 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis415 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	echo -e "CIS $cis415 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $archi == *"64"* ]]; then
	if [[ $(grep system-locale /etc/audit/audit.rules 2>/dev/null | grep b64 | grep always | grep adjtimex | grep setdomainname | grep hostname) ]]; then
		if [[ $(grep system-locale /etc/audit/audit.rules 2>/dev/null | grep issue) ]]; then
			if [[ $(grep system-locale /etc/audit/audit.rules 2>/dev/null | grep hosts) ]]; then
				if [[ $(grep system-locale /etc/audit/audit.rules 2>/dev/null | grep network) ]]; then
					echo -e "CIS $cis416 \e[32m\e[1mpassed\e[0m"
				else
					echo -e "CIS $cis416 \e[31m\e[1m\e[5mfailed\e[0m"
				fi
			else
				echo -e "CIS $cis416 \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		else
			echo -e "CIS $cis416 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis416 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	if [[ $(grep system-locale /etc/audit/audit.rules 2>/dev/null | grep b32 | grep always | grep adjtimex | grep setdomainname | grep hostname) ]]; then
		if [[ $(grep system-locale /etc/audit/audit.rules 2>/dev/null | grep issue) ]]; then
			if [[ $(grep system-locale /etc/audit/audit.rules 2>/dev/null | grep hosts) ]]; then
				if [[ $(grep system-locale /etc/audit/audit.rules 2>/dev/null | grep network) ]]; then
					echo -e "CIS $cis416 \e[32m\e[1mpassed\e[0m"
				else
					echo -e "CIS $cis416 \e[31m\e[1m\e[5mfailed\e[0m"
				fi
			else
				echo -e "CIS $cis416 \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		else
			echo -e "CIS $cis416 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis416 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
fi

if [[ $(grep MAC-policy /etc/audit/audit.rules | grep selinux 2>/dev/null) ]]; then
	if [[ $(grep MAC-policy /etc/audit/audit.rules | grep apparmor 2>/dev/null) ]]; then
		echo -e "CIS $cis417 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis417 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	echo -e "CIS $cis417 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep logins /etc/audit/audit.rules 2>/dev/null | grep failing | grep lastlog | grep tallylog) ]]; then
	echo -e "CIS $cis418 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis418 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep session /etc/audit/audit.rules 2>/dev/null | grep utmp | grep wtmp | grep btmp) ]]; then
	echo -e "CIS $cis419 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis419 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $archi == *"64"* ]]; then
	if [[ $(grep perm_mod /etc/audit/audit.rules 2>/dev/null | grep always | grep b64 | grep chmod) ]]; then
		if [[ $(grep perm_mod /etc/audit/audit.rules 2>/dev/null | grep always | grep b64 | grep chown) ]]; then
			if [[ $(grep system-perm_mod /etc/audit/audit.rules 2>/dev/null | grep always | grep b64 | grep xattr) ]]; then
				echo -e "CIS $cis4110 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis4110 \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		else
			echo -e "CIS $cis4110 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis4110 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	if [[ $(grep perm_mod /etc/audit/audit.rules 2>/dev/null | grep always | grep b32 | grep chmod ) ]]; then
		if [[ $(grep perm_mod /etc/audit/audit.rules 2>/dev/null | grep always | grep b32 | grep chown) ]]; then
			if [[ $(grep system-perm_mod /etc/audit/audit.rules 2>/dev/null | grep always | grep b32 | grep xattr) ]]; then
				echo -e "CIS $cis4110 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis4110 \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		else
			echo -e "CIS $cis4110 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis4110 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
fi

if [[ $archi == *"64"* ]]; then
	if [[ $(grep access /etc/audit/audit.rules 2>/dev/null | grep always | grep b64 | grep open | grep truncate | grep EACCESS) ]]; then
		if [[ $(grep access /etc/audit/audit.rules 2>/dev/null | grep always | grep b64 | grep open | grep truncate | grep EPERM) ]]; then
			echo -e "CIS $cis4111 \e[32m\e[1mpassed\e[0m"
		else
			echo -e "CIS $cis4111 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis4111 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	if [[ $(grep access /etc/audit/audit.rules 2>/dev/null | grep always | grep b32 | grep open | grep truncate | grep EACCESS) ]]; then
		if [[ $(grep access /etc/audit/audit.rules 2>/dev/null | grep always | grep b32 | grep open | grep truncate | grep EPERM) ]]; then
			echo -e "CIS $cis4111 \e[32m\e[1mpassed\e[0m"
		else
			echo -e "CIS $cis4111 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis4111 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
fi

i=0
j=0

for OUTPUT in $(find / -xdev \( -perm -4000 -o  -perm -2000 \) -type f | awk '{print "-a|always,exit|-F|path="$1"|-F|perm=x|-F|auid|>=|1000|-F|auid!=4294967295|-k|privileged"}')
do
	gr=${OUTPUT//|/ }
	gre=${gr//-/\\-}
	
	if [[ $(grep "$gre" /etc/audit/auditd.conf 2>/dev/null ) ]]; then
		((j=j+1))
	fi
	((i=i+1))
done

if [ $j -eq $i ]; then
	echo -e "CIS $cis4112 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis4112 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $archi == *"64"* ]]; then
	if [[ $(grep mounts /etc/audit/audit.rules 2>/dev/null | grep always | grep mount | grep b64) ]]; then
		echo -e "CIS $cis4113 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis4113 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	if [[ $(grep mounts /etc/audit/audit.rules 2>/dev/null | grep always | grep mount | grep b32) ]]; then
		echo -e "CIS $cis4113 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis4113 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
fi

if [[ $archi == *"64"* ]]; then
	if [[ $(grep delete /etc/audit/audit.rules 2>/dev/null | grep always | grep b64 | grep unlink | grep rename) ]]; then
		echo -e "CIS $cis4114 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis4114 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	if [[ $(grep delete /etc/audit/audit.rules 2>/dev/null | grep always | grep b32 | grep unlink | grep rename) ]]; then
		echo -e "CIS $cis4114 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis4114 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
fi

if [[ $(grep scope /etc/audit/audit.rules 2>/dev/null | grep sudoers) ]]; then
	echo -e "CIS $cis4115 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis4115 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep actions /etc/audit/audit.rules 2>/dev/null | grep sudo) ]]; then
	echo -e "CIS $cis4116 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis4116 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $archi == *"64"* ]]; then
	if [[ $(grep module /etc/audit/audit.rules 2>/dev/null | grep always | grep b64 | grep insmod | grep rmmod | grep modprobe) ]]; then
		echo -e "CIS $cis4117 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis4117 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	if [[ $(grep module /etc/audit/audit.rules 2>/dev/null | grep always | grep b64 | grep insmod | grep rmmod | grep modprobe) ]]; then
		echo -e "CIS $cis4117 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis4117 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
fi

if [[ $(grep "^\s*[^#]" /etc/audit/audit.rules 2>/dev/null | grep "-e 2" ) ]]; then 
	echo -e "CIS $cis4118 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis4118 \e[31m\e[1m\e[5mfailed\e[0m"
fi

echo -e "###### Check CIS Controls 4.2 Configure Logging ######"

rsys=$(systemctl is-enabled rsyslog 2>/dev/null)

if [[ $rsys == *"enabled"* ]]; then
	echo -e "CIS $cis4211 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis4211 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep "/var/log" /etc/rsyslog.conf 2>/dev/null | grep "log") ]]; then
	echo -e "CIS $cis4212 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis4212 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep ^\$FileCreateMode /etc/rsyslog.conf 2>/dev/null | grep "640") ]]; then
	echo -e "CIS $cis4213 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis4213 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep "^*.*[^I][^I]*@" /etc/rsyslog.conf 2>/dev/null | grep "*.*@@") ]]; then
	echo -e "CIS $cis4214 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis4214 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep '$ModLoad imtcp' /etc/rsyslog.conf 2>/dev/null | grep ModLoad) ]]; then
	if [[ $(grep '$InputTCPServerRun' /etc/rsyslog.conf 2> /dev/null | grep InputTCPServer) ]]; then
		echo -e "CIS $cis4215 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis4215 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	echo -e "CIS $cis4215 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(rpm -q rsyslog | grep "is not installed") ]]; then
	echo -e "CIS $cis423 \e[31m\e[1m\e[5mfailed\e[0m"
else
	echo -e "CIS $cis423 \e[32m\e[1mpassed\e[0m"
fi

if [[ $(find /var/log -type f -ls | awk '{a=$3; b=$11; c=" "; print a c b}' | sed s/-rw-/" "/1 | grep "w-") ]]; then
	echo -e "CIS $cis424 \e[31m\e[1m\e[5mfailed\e[0m"
else
	echo -e "CIS $cis424 \e[32m\e[1mpassed\e[0m"
fi

if [[ $(cat /etc/logrotate.conf) ]]; then
	echo -e "CIS $cis43 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis43 \e[31m\e[1m\e[5mfailed\e[0m"
fi

echo -e "###### Check CIS Controls 5.1 Configure Cron ######"

crond=$(systemctl is-enabled cron 2>/dev/null)

if [[ $crond == *"enabled"* ]]; then
	echo -e "CIS $cis511 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis511 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(stat /etc/crontab 2>/dev/null | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0600") ]]; then
        echo -e "CIS $cis512 \e[32m\e[1mpassed\e[0m"
else
        echo -e "CIS $cis512 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(stat /etc/crontab.hourly 2>/dev/null | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0700") ]]; then
        echo -e "CIS $cis513 \e[32m\e[1mpassed\e[0m"
else
        echo -e "CIS $cis513 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(stat /etc/crontab.daily 2>/dev/null | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0700") ]]; then
        echo -e "CIS $cis514 \e[32m\e[1mpassed\e[0m"
else
        echo -e "CIS $cis514 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(stat /etc/crontab.weekly 2>/dev/null | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0700") ]]; then
        echo -e "CIS $cis515 \e[32m\e[1mpassed\e[0m"
else
        echo -e "CIS $cis515 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(stat /etc/crontab.monthly 2>/dev/null | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0700") ]]; then
        echo -e "CIS $cis516 \e[32m\e[1mpassed\e[0m"
else
        echo -e "CIS $cis516 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(stat /etc/cron.d 2>/dev/null | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0700") ]]; then
        echo -e "CIS $cis517 \e[32m\e[1mpassed\e[0m"
else
        echo -e "CIS $cis517 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(stat /etc/cron.deny | grep "No such file or director") ]]; then
	if [[ $(stat /etc/at.deny | grep "No such file or director") ]]; then
		if [[ $(stat /etc/cron.allow | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0600") ]]; then
			if [[ $(stat /etc/at.allow | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0600") ]]; then
        		echo -e "CIS $cis518 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis518 \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		else
			echo -e "CIS $cis518 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis518 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
        echo -e "CIS $cis518 \e[31m\e[1m\e[5mfailed\e[0m"
fi

echo -e "###### Check CIS Controls 5.2 SSH Server Configuration ######"

if [[ $(stat /etc/ssh/sshd_config 2>/dev/null | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0600") ]]; then
        echo -e "CIS $cis521 \e[32m\e[1mpassed\e[0m"
else
        echo -e "CIS $cis521 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep "^Protocol" /etc/ssh/sshd_config 2>/dev/null | grep Protocol) ]]; then
	echo -e "CIS $cis522 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis522 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep "^LogLevel" /etc/ssh/sshd_config 2>/dev/null | grep INFO) ]]; then
	echo -e "CIS $cis523 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis523 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep "^X11Forwarding" /etc/ssh/sshd_config 2>/dev/null | grep no) ]]; then
	echo -e "CIS $cis524 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis524 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep "^MaxAuthTries" /etc/ssh/sshd_config 2>/dev/null | awk '{ if($2>9) print$2 }' ) ]]; then # grep "12[4-9][0-9]*" filename
	echo -e "CIS $cis525 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis525 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep "^IgnoreRhosts" /etc/ssh/sshd_config 2>/dev/null | grep yes ) ]]; then
	echo -e "CIS $cis526 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis526 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep "^HostbasedAuthentication" /etc/ssh/sshd_config 2>/dev/null | grep no ) ]]; then
	echo -e "CIS $cis527 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis527 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep "^PermitRootLogin" /etc/ssh/sshd_config 2>/dev/null | grep no ) ]]; then
	echo -e "CIS $cis528 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis528 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep "^PermitEmptyPasswords" /etc/ssh/sshd_config 2>/dev/null | grep no ) ]]; then
	echo -e "CIS $cis529 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis529 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep "^PermitUserEnvironment" /etc/ssh/sshd_config 2>/dev/null | grep no ) ]]; then
	echo -e "CIS $cis5210 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis5210 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep "^MAC" /etc/ssh/sshd_config 2>/dev/null | grep cbc) ]]; then
	echo -e "CIS $cis5211 \e[31m\e[1m\e[5mfailed\e[0m"
elif [[ $(grep "^MAC" /etc/ssh/sshd_config 2>/dev/null | grep des) ]]; then
	echo -e "CIS $cis5211 \e[31m\e[1m\e[5mfailed\e[0m"
elif [[ $(grep "^MAC" /etc/ssh/sshd_config 2>/dev/null | grep ssh) ]]; then
	echo -e "CIS $cis5211 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis5211 \e[31m\e[1m\e[5mfailed\e[0m"	
fi

if [[ $(grep "^ClientAliveInterval" /etc/ssh/sshd_config 2>/dev/null | awk '{ if($2>1799) print$2 }' ) ]]; then
	if [[ $(grep "^ClientAliveCountMax" /etc/ssh/sshd_config 2>/dev/null | grep "0" ) ]]; then
		echo -e "CIS $cis5212 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis5212 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	echo -e "CIS $cis5212 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep "^LoginGraceTime" /etc/ssh/sshd_config 2>/dev/null | awk '{ if($2>59) print$2 }' ) ]]; then
	echo -e "CIS $cis5213 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis5213 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep "^AllowUsers" /etc/ssh/sshd_config 2>/dev/null) ]]; then
	if [[ $(grep "^AllowGroups" /etc/ssh/sshd_config 2>/dev/null) ]]; then
		if [[ $(grep "^DenyUsers" /etc/ssh/sshd_config 2>/dev/null) ]]; then
			if [[ $(grep "^DenyGroups" /etc/ssh/sshd_config 2>/dev/null) ]]; then
				echo -e "CIS $cis5214 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis5214 \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		else
			echo -e "CIS $cis5214 \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	else
		echo -e "CIS $cis5214 \e[31m\e[1m\e[5mfailed\e[0m"
	fi
else
	echo -e "CIS $cis5214 \e[31m\e[1m\e[5mfailed\e[0m"
fi

if [[ $(grep "^Banner" /etc/ssh/sshd_config 2>/dev/null | grep issue ) ]]; then
	echo -e "CIS $cis5215 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis5215 \e[31m\e[1m\e[5mfailed\e[0m"
fi
