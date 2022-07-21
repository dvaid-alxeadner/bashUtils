 #! /bin/bash

if [[ $1 == "R" ]]; then
	echo -e "###### Suse Linux CISv8 Baseline Remediation ######"
else
	echo -e "###### Suse Linux CISv8 Baseline Check ######"
fi

echo -e "###### Check CIS Controls 1.1.1 Filesystem Configuration ######"



if [[ $(rpm -qa bc | grep "is not installed") ]]; then
	zypper install bc
fi

ccis=0
cfcis=0

cis1111="1.1.1.1 Ensure mounting of squashfs filesystems is disabled L2"
cis1112="1.1.1.2 Ensure mounting of udf filesystems is disabled L1 (1)"
cis1113="1.1.1.3 Ensure mounting of FAT filesystems is limited L2"
cis112="1.1.2 Ensure /tmp is configured L1 (2)"
cis113="1.1.3 Ensure noexec option set on /tmp partition L1 (3)"
cis114="1.1.4 Ensure nodev option set on /tmp partition L1 (4)"
cis115="1.1.5 Ensure nosuid option set on /tmp partition L1 (5)"
cis116="1.1.6 Ensure /dev/shm is configured L1 (6)"
cis117="1.1.7 Ensure noexec option set on /dev/shm partition L1 (7)"
cis118="1.1.8 Ensure nodev option set on /dev/shm partition L1 (8)"
cis119="1.1.9 Ensure nosuid option set on /dev/shm partition L1 (9)"
cis1110="1.1.10 Ensure separate partition exists for /var L2"
cis11_11="1.1.11 Ensure separate partition exists for /var/tmp L2"
cis11_12="1.1.12 Ensure noexec option set on /var/tmp partition L1 (10)"
cis11_13="1.1.13 Ensure nodev option set on /var/tmp partition L1 (11)"
cis11_14="1.1.14 Ensure nosuid option set on /var/tmp partition L1 (12)"
cis11_15="1.1.15 Ensure separate partition exists for /var/log L2"
cis11_16="1.1.16 Ensure separate partition exists for /var/log/audit L2"
cis11_17="1.1.17 Ensure separate partition exists for /home L2"
cis11_18="1.1.18 Ensure nodev option set on /home partition L1 (13)"
cis11_19="1.1.19 Ensure noexec option set on removable media partitions L1 (14)"
cis11_20="1.1.20 Ensure nodev option set on removable media partitions L1 (15)"
cis11_21="1.1.21 Ensure nosuid option set on removable media partitions L1 (16)"
cis11_22="1.1.22 Ensure sticky bit is set on all world-writable directories L1 (17)"
cis11_23="1.1.23 Disable Automounting L1 (18)"
cis121="1.2.1 Ensure GPG keys are configured L1 (19)"
cis122="1.2.2 Ensure package manager repositories are configured L1 (20)"
cis123="1.2.3 Ensure gpgcheck is globally activated L1 (21)"
cis131="1.3.1 Ensure sudo is installed L1 (22)"
cis132="1.3.2 Ensure sudo commands use pty L1 (23)"
cis133="1.3.3 Ensure sudo log file exists L1 (24)"
cis141="1.4.1 Ensure AIDE is installed L1 (25)"
cis142="1.4.2 Ensure filesystem integrity is regularly checked L1 (26)"
cis151="1.5.1 Ensure bootloader password is set L1 (27)"
cis152="1.5.2 Ensure permissions on bootloader config are configured L1 (28)"
cis153="1.5.3 Ensure authentication required for single user mode L1 (29)"
cis161="1.6.1 Ensure core dumps are restricted L1 (30)"
cis162="1.6.2 Ensure XD/NX support is enabled L1 (31)"
cis163="1.6.3 Ensure address space layout randomization (ASLR) is enabled L1 (32)"
cis164="1.6.4 Ensure prelink is disabled L1 (33)"
cis1711="1.7.1.1 Ensure AppArmor is installed L1 (34)"
cis1712="1.7.1.2 Ensure AppArmor is enabled in the bootloader configuration L1 (35)"
cis1713="1.7.1.3 Ensure all AppArmor Profiles are in enforce or complain mode L1 (36)"
cis1714="1.7.1.4 Ensure all AppArmor Profiles are enforcing L2"
cis1811="1.8.1.1 Ensure message of the day is configured properly L1 (37)"
cis1812="1.8.1.2 Ensure local login warning banner is configured properly L1 (38)"
cis1813="1.8.1.3 Ensure remote login warning banner is configured properly L1 (39)"
cis1814="1.8.1.4 Ensure permissions on /etc/motd are configured L1 (40)"
cis1815="1.8.1.5 Ensure permissions on /etc/issue are configured L1 (41)"
cis1816="1.8.1.6 Ensure permissions on /etc/issue.net are configured L1 (42)"
cis19="1.9 Ensure updates, patches, and additional security software are installed L1 (43)"
cis110="1.10 Ensure GDM is removed or login is configured L1 (44)"
cis211="2.1.1 Ensure xinetd is not installed L1 (45)"
cis2211="2.2.1.1 Ensure time synchronization is in use L1 (46)"
cis2212="2.2.1.2 Ensure systemd-timesyncd is configured L1 (47)"
cis2213="2.2.1.3 Ensure chrony is configured OUT OF SCOPE (48)"
cis222="2.2.2 Ensure X11 Server components are not installed L1 (49)"
cis223="2.2.3 Ensure Avahi Server is not installed L1 (50)"
cis224="2.2.4 Ensure CUPS is not installed L1 (51)"
cis225="2.2.5 Ensure DHCP Server is not installed L1 (52)"
cis226="2.2.6 Ensure LDAP server is not installed L1 (53)"
cis227="2.2.7 Ensure nfs-utils is not installed or the nfs-server service is masked OUT OF SCOPE (54)"
cis228="2.2.8 Ensure rpcbind is not installed or the rpcbind services are masked L1 (55)"
cis229="2.2.9 Ensure DNS Server is not installed L1 (56)"
cis22_10="2.2.10 Ensure FTP Server is not installed L1 (57)"
cis22_11="2.2.11 Ensure HTTP server is not installed OUT OF SCOPE (58)"
cis22_12="2.2.12 Ensure IMAP and POP3 server is not installed L1 (59)"
cis22_13="2.2.13 Ensure Samba is not installed L1 (60)"
cis22_14="2.2.14 Ensure HTTP Proxy Server is not installed L1 (61)"
cis22_15="2.2.15 Ensure net-snmp is not installed L1 (62)"
cis22_16="2.2.16 Ensure mail transfer agent is configured for local-only mode L1 (63)"
cis22_17="2.2.17 Ensure rsync is not installed or the rsyncd service is masked L1 (64)"
cis22_18="2.2.18 Ensure NIS server is not installed L1 (65)"
cis22_19="2.2.19 Ensure telnet-server is not installed L1 (66)"
cis231="2.3.1 Ensure NIS Client is not installed L1 (67)"
cis232="2.3.2 Ensure rsh client is not installed L1 (68)"
cis233="2.3.3 Ensure talk client is not installed L1 (69)"
cis234="2.3.4 Ensure telnet client is not installed L1 (70)"
cis235="2.3.5 Ensure LDAP client is not installed L1 (71)"
cis311="3.1.1 Disable IPv6 L2"
cis312="3.1.2 Ensure wireless interfaces are disabled L1 (72)"
cis321="3.2.1 Ensure IP forwarding is disabled L1 (73)"
cis322="3.2.2 Ensure packet redirect sending is disabled L1 (74)"
cis331="3.3.1 Ensure source routed packets are not accepted L1 (75)"
cis332="3.3.2 Ensure ICMP redirects are not accepted L1 (76)"
cis333="3.3.3 Ensure secure ICMP redirects are not accepted L1 (77)"
cis334="3.3.4 Ensure suspicious packets are logged L1 (78)"
cis335="3.3.5 Ensure broadcast ICMP requests are ignored L1 (79)"
cis336="3.3.6 Ensure bogus ICMP responses are ignored L1 (80)"
cis337="3.3.7 Ensure Reverse Path Filtering is enabled L1 (81)"
cis338="3.3.8 Ensure TCP SYN Cookies is enabled L1 (82)"
cis339="3.3.9 Ensure IPv6 router advertisements are not accepted L1 (83)"
cis341="3.4.1 Ensure DCCP is disabled L2"
cis342="3.4.2 Ensure SCTP is disabled L2"
cis3511="3.5.1.1 Ensure FirewallD is installed OUT OF SCOPE (84)"
cis3512="3.5.1.2 Ensure nftables is not installed or stopped and masked OUT OF SCOPE (85)"
cis3513="3.5.1.3 Ensure firewalld service is enabled and running OUT OF SCOPE (86)"
cis3514="3.5.1.4 Ensure default zone is set OUT OF SCOPE (87)"
cis3515="3.5.1.5 Ensure network interfaces are assigned to appropriate zone OUT OF SCOPE (89)"
cis3516="3.5.1.6 Ensure unnecessary services and ports are not accepted OUT OF SCOPE (89)"
cis35311="3.5.3.1.1 Ensure iptables package is installed OUT OF SCOPE (91)"
cis35312="3.5.3.1.2 Ensure nftables is not installed OUT OF SCOPE (92)"
cis35313="3.5.3.1.3 Ensure firewalld is not installed or stopped and masked OUT OF SCOPE (93)"
cis35321="3.5.3.2.1 Ensure default deny firewall policy OUT OF SCOPE (94)"
cis35322="3.5.3.2.2 Ensure loopback traffic is configured OUT OF SCOPE (95)"
cis35323="3.5.3.2.3 Ensure outbound and established connections are configured OUT OF SCOPE (96)"
cis35324="3.5.3.2.4 Ensure firewall rules exist for all open ports OUT OF SCOPE (97)"
cis4111="4.1.1.1 Ensure auditd is installed L2"
cis4112="4.1.1.2 Ensure auditd service is enabled and running L2"
cis4113="4.1.1.3 Ensure auditing for processes that start prior to auditd is enabled L2"
cis4121="4.1.2.1 Ensure audit log storage size is configured L2"
cis4122="4.1.2.2 Ensure audit logs are not automatically deleted L2"
cis4123="4.1.2.3 Ensure system is disabled when audit logs are full L2"
cis4124="4.1.2.4 Ensure audit_backlog_limit is sufficient L2"
cis413="4.1.3 Ensure events that modify date and time information are collected L2"
cis414="4.1.4 Ensure events that modify user/group information are collected L2"
cis415="4.1.5 Ensure events that modify the system's network environment are collecte L2"
cis416="4.1.6 Ensure events that modify the system's Mandatory Access Controls are collected L2"
cis417="4.1.7 Ensure login and logout events are collected L2"
cis418="4.1.8 Ensure session initiation information is collected L2"
cis419="4.1.9 Ensure discretionary access control permission modification events are collected L2"
cis41_10="4.1.10 Ensure unsuccessful unauthorized file access attempts are collected L2"
cis41_11="4.1.11 Ensure use of privileged commands is collected L2"
cis41_12="4.1.12 Ensure successful file system mounts are collected L2"
cis41_13="4.1.13 Ensure file deletion events by users are collected L2"
cis41_14="4.1.14 Ensure changes to system administration scope (sudoers) is collected L2"
cis41_15="4.1.15 Ensure system administrator actions (sudolog) are collected L2"
cis41_16="4.1.16 Ensure kernel module loading and unloading is collected L2"
cis41_17="4.1.17 Ensure the audit configuration is immutable L2"
cis4211="4.2.1.1 Ensure rsyslog is installed L1 (98)"
cis4212="4.2.1.2 Ensure rsyslog Service is enabled and running L1 (99)"
cis4213="4.2.1.3 Ensure rsyslog default file permissions configured L1 (100)"
cis4214="4.2.1.4 Ensure logging is configured L1 (101)"
cis4215="4.2.1.5 Ensure rsyslog is configured to send logs to a remote log host L1 (102)"
cis4216="4.2.1.6 Ensure remote rsyslog messages are only accepted on designated log hosts L1 (103)"
cis4221="4.2.2.1 Ensure journald is configured to send logs to rsyslog L1 (104)"
cis4222="4.2.2.2 Ensure journald is configured to compress large log files L1 (105)"
cis4223="4.2.2.3 Ensure journald is configured to write logfiles to persistent disk L1 (106)"
cis423="4.2.3 Ensure permissions on all logfiles are configured L1 (107)"
cis424="4.2.4 Ensure logrotate is configured L1 (108)"
cis511="5.1.1 Ensure cron daemon is enabled and running L1 (109)"
cis512="5.1.2 Ensure permissions on /etc/crontab are configured L1 (110)"
cis513="5.1.3 Ensure permissions on /etc/cron.hourly are configured L1 (111)"
cis514="5.1.4 Ensure permissions on /etc/cron.daily are configured L1 (112)"
cis515="5.1.5 Ensure permissions on /etc/cron.weekly are configured L1 (113)"
cis516="5.1.6 Ensure permissions on /etc/cron.monthly are configured L1 (114)"
cis517="5.1.7 Ensure permissions on /etc/cron.d are configured L1 (115)"
cis518="5.1.8 Ensure cron is restricted to authorized users L1 (116)"
cis519="5.1.9 Ensure at is restricted to authorized users L1 (117)"
cis521="5.2.1 Ensure permissions on /etc/ssh/sshd_config are configured L1 (118)"
cis522="5.2.2 Ensure permissions on SSH private host key files are configured L1 (119)"
cis523="5.2.3 Ensure permissions on SSH public host key files are configured L1 (120)"
cis524="5.2.4 Ensure SSH access is limited L1 (121)"
cis525="5.2.5 Ensure SSH LogLevel is appropriate L1 (122)"
cis526="5.2.6 Ensure SSH X11 forwarding is disabled L2"
cis527="5.2.7 Ensure SSH MaxAuthTries is set to 4 or less L1 (123)"
cis528="5.2.8 Ensure SSH IgnoreRhosts is enabled L1 (124)"
cis529="5.2.9 Ensure SSH HostbasedAuthentication is disabled L1 (125)"
cis5210="5.2.10 Ensure SSH root login is disabled L1 (126)"
cis5211="5.2.11 Ensure SSH PermitEmptyPasswords is disabled L1 (127)"
cis5212="5.2.12 Ensure SSH PermitUserEnvironment is disabled L1 (128)"
cis5213="5.2.13 Ensure only strong Ciphers are used L1 (129)"
cis5214="5.2.14 Ensure only strong MAC algorithms are used L1 (130)"
cis5215="5.2.15 Ensure only strong Key Exchange algorithms are used L1 (131)"
cis5216="5.2.16 Ensure SSH Idle Timeout Interval is configured L1 (132)"
cis5217="5.2.17 Ensure SSH LoginGraceTime is set to one minute or less L1 (133)"

if [[ $(modprobe -n -v udf | grep -E '(udf)') ]]; then
	echo -e "CIS $cis1112 \e[31m\e[1m\e[5mfailed\e[0m udf module found"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		echo "install udf /bin/true" > /etc/modprobe.d/cis1112_remediation
		if [[ $(modprobe -r udf 2>/dev/null) ]]; then
			echo -e "CIS $cis1112 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		else
			echo -e "CIS $cis1112 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi
else
	echo -e "CIS $cis1112 \e[32m\e[1mpassed\e[0m"
fi
((ccis=ccis+1))

if [[ $(mount | grep /tmp) ]]; then
	echo -e "CIS $cis112 \e[32m\e[1mpassed\e[0m"
	if [[ $(mount | grep /tmp | grep nodev) ]]; then
		echo -e "CIS $cis114 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis114 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi

	if [[ $(mount | grep /tmp | grep nosuid) ]]; then
		echo -e "CIS $cis115 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis115 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi

	if [[ $(mount | grep /tmp | grep noexec) ]]; then
		echo -e "CIS $cis113 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis113 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi
else
	echo -e "CIS $cis112 \e[31m\e[1m\e[5mfailed\e[0m /tmp must be mounted on a separate partition"
	((cfcis=cfcis+1))
	echo -e "CIS $cis113 \e[31m\e[1m\e[5mfailed\e[0m noexec option must be set on /tmp partition"
	((cfcis=cfcis+1))
	echo -e "CIS $cis114 \e[31m\e[1m\e[5mfailed\e[0m nodev option must be set on /tmp partition"
	((cfcis=cfcis+1))
	echo -e "CIS $cis115 \e[31m\e[1m\e[5mfailed\e[0m nosuid option must be set on /tmp partition"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))
((ccis=ccis+1))
((ccis=ccis+1))
((ccis=ccis+1))

if [[ $(mount | grep "/dev/shm ") ]]; then
	echo -e "CIS $cis116 \e[32m\e[1mpassed\e[0m"
	if [[ $(mount | grep /dev/shm | grep noexec) ]]; then
		echo -e "CIS $cis117 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis117 \e[31m\e[1m\e[5mfailed\e[0m noexec option must be set on /dev/shm partition"
		((cfcis=cfcis+1))
	fi

	if [[ $(mount | grep /dev/shm | grep nodev) ]]; then
		echo -e "CIS $cis118 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis118 \e[31m\e[1m\e[5mfailed\e[0m nodev option must be set on /dev/shm partition"
		((cfcis=cfcis+1))
	fi

	if [[ $(mount | grep /dev/shm | grep nosuid) ]]; then
		echo -e "CIS $cis119 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis119 \e[31m\e[1m\e[5mfailed\e[0m nosuid option must be set on /dev/shm partition"
		((cfcis=cfcis+1))
	fi
else
	echo -e "CIS $cis116 \e[31m\e[1m\e[5mfailed\e[0m /dev/shm partition must be configured"
	((cfcis=cfcis+1))
	echo -e "CIS $cis117 \e[31m\e[1m\e[5mfailed\e[0m noexec option must be set on /dev/shm partition"
	((cfcis=cfcis+1))
	echo -e "CIS $cis118 \e[31m\e[1m\e[5mfailed\e[0m nodev option must be set on /dev/shm partition"
	((cfcis=cfcis+1))
	echo -e "CIS $cis119 \e[31m\e[1m\e[5mfailed\e[0m nosuid option must be set on /dev/shm partition"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))
((ccis=ccis+1))
((ccis=ccis+1))
((ccis=ccis+1))

if [[ $(mount | grep "/var/tmp ") ]]; then

	if [[ $(mount | grep /var/tmp | grep noexec) ]]; then
		echo -e "CIS $cis11_12 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis11_12 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi

	if [[ $(mount | grep /var/tmp | grep nodev) ]]; then
		echo -e "CIS $cis11_13 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis11_13 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi

	if [[ $(mount | grep /var/tmp | grep nosuid) ]]; then
		echo -e "CIS $cis11_14 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis11_14 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi

	
else
	echo -e "CIS $cis11_12 \e[31m\e[1m\e[5mfailed\e[0m noexec option must be set on /var/tmp partition"
	((cfcis=cfcis+1))
	echo -e "CIS $cis11_13 \e[31m\e[1m\e[5mfailed\e[0m nodev option must be set on /var/tmp partition"
	((cfcis=cfcis+1))
	echo -e "CIS $cis11_14 \e[31m\e[1m\e[5mfailed\e[0m nosuid option must be set on /var/tmp partition"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))
((ccis=ccis+1))
((ccis=ccis+1))

if [[ $(mount | grep "/home ") ]]; then
	if [[ $(mount | grep /home | grep nodev) ]]; then
		echo -e "CIS $cis11_18 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis11_18 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi
else
	echo -e "CIS $cis11_18 \e[31m\e[1m\e[5mfailed\e[0m nodev option must be set on /home partition"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

if [[ $(mount | grep noexec | grep cdrom) ]]; then
    echo -e "CIS $cis11_19 \e[32m\e[1mpassed\e[0m"
else
    echo -e "CIS $cis11_19 Unknown or Not Applicable"
fi

if [[ $(mount | grep nodev | grep cdrom) ]]; then
	echo -e "CIS $cis11_20 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis11_20 Unknown or Not Applicable"
fi

if [[ $(mount | grep nosuid | grep cdrom) ]]; then
    echo -e "CIS $cis11_21 \e[32m\e[1mpassed\e[0m"
else
    echo -e "CIS $cis11_21 Unknown or Not Applicable"
fi

resultperm=$(df --local -P 2>/dev/null | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a \! -perm -1000 \) 2> /dev/null)

if [[ $resultperm ]]; then
	echo -e "CIS $cis11_22 \e[31m\e[1m\e[5mfailed\e[0m sticky bit is not set on world-writable directories:"
	echo -e $resultperm
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		if [[ $(echo $resultperm | xargs chmod a+t 2>&1) ]]; then
			echo -e "CIS $cis11_22 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		else
			echo -e "CIS $cis11_22 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	else
		echo -e "execute chmod a+t over above directories to resolve the issue"
	fi	
else
	echo -e "CIS $cis11_22 \e[32m\e[1mpassed\e[0m"
fi
((ccis=ccis+1))

if [[ $(systemctl is-enabled autofs | grep disabled) ]]; then
	echo -e "CIS $cis11_23 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis11_23 \e[31m\e[1m\e[5mfailed\e[0m Automounting is not disabled "
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		systemctl --now mask autofs
		if [[$(systemctl is-enabled autofs | grep disabled)]]; then
			echo -e "CIS $cis11_23 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis11_23 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
fi
((ccis=ccis+1))

echo -e "###### Check CIS Controls 1.2 Configure Software Updates ######"

if [[ $(rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\n' | grep gpg-pub) ]]; then
	echo -e "CIS $cis121 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis121 \e[31m\e[1m\e[5mfailed\e[0m package manager GPG keys need to be updated"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

if [[ $(zypper repos | cut -d\| -f 1-4 | grep pdate | grep Yes) ]]; then
	echo -e "CIS $cis122 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis122 \e[31m\e[1m\e[5mfailed\e[0m package manager repositories must be configured"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

if [[ $(grep ^\s*gpgcheck /etc/zypp/zypp.conf | grep gpgcheck) ]]; then
	echo -e "CIS $cis123 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis123 \e[31m\e[1m\e[5mfailed\e[0m GPG check needs to be globally activated"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

echo -e "###### Check CIS Controls 1.3 Configure sudo ######"

if [[ $(rpm -q sudo | grep sudo) ]]; then
	echo -e "CIS $cis131 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis131 \e[31m\e[1m\e[5mfailed\e[0m sudo must be installed"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		zypper install sudo
		if [[$(rpm -q sudo | grep sudo) ]]; then
			echo -e "CIS $cis131 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis131 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
fi
((ccis=ccis+1))

if [[ $(grep -Ei '^\s*Defaults\s+([^#]\S+,\s*)?use_pty\b' /etc/sudoers /etc/sudoers.d/* | grep use_pty) ]]; then
	echo -e "CIS $cis132 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis132 \e[31m\e[1m\e[5mfailed\e[0m sudo must be configured to run only from a pseudo-pty"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		echo "Defaults use_pty" > /etc/sudoers.d/cis132_remediation
		if [[$(grep -Ei '^\s*Defaults\s+([^#]\S+,\s*)?use_pty\b' /etc/sudoers /etc/sudoers.d/* | grep use_pty) ]]; then
			echo -e "CIS $cis132 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis132 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
fi
((ccis=ccis+1))

if [[ $(grep -Ei '^\s*Defaults\s+([^#;]+,\s*)?logfile\s*=\s*(")?[^#;]+(")?' /etc/sudoers /etc/sudoers.d/* | grep logfile) ]]; then
	echo -e "CIS $cis133 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis133 \e[31m\e[1m\e[5mfailed\e[0m sudo must have a custom log file configured"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		echo 'Defaults logfile="/var/log/sudo.log"' > /etc/sudoers.d/cis133_remediation
		if [[$(grep -Ei '^\s*Defaults\s+([^#;]+,\s*)?logfile\s*=\s*(")?[^#;]+(")?' /etc/sudoers /etc/sudoers.d/* | grep logfile) ]]; then
			echo -e "CIS $cis133 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis133 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
fi
((ccis=ccis+1))

echo -e "###### Check CIS Controls 1.4 Filesystem Integrity Check ######"

if [[ $(rpm -q aide | grep "is not installed") ]]; then
	echo -e "CIS $cis141 \e[31m\e[1m\e[5mfailed\e[0m AIDE must be installed"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		if [[ $(zypper -n install aide) ]]; then
			aide --init
			mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db
			echo -e "CIS $cis141 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis141 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
else
	echo -e "CIS $cis141 \e[32m\e[1mpassed\e[0m"
fi
((ccis=ccis+1))

if [[ $(grep -r aide /etc/cron.* /etc/crontab) ]]; then
	echo -e "CIS $cis142 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis142 \e[31m\e[1m\e[5mfailed\e[0m filesystem integrity must be checked regularly "
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))


echo -e "###### Check CIS Controls 1.5 Secure Boot Settings ######"

if [[ $(grep "^\s*set superusers" /boot/grub2/grub.cfg | grep superusers) ]]; then
	if [[ $(grep "^\s*password" /boot/grub2/grub.cfg | grep pbkdf) ]]; then
		echo -e "CIS $cis151 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis151 \e[31m\e[1m\e[5mfailed\e[0m bootloader password is not set"
		((cfcis=cfcis+1))
	fi
else
	echo -e "CIS $cis151 \e[31m\e[1m\e[5mfailed\e[0m bootloader password is not set"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

if [[ $(stat /boot/grub2/grub.cfg | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0600/-rw-------)") ]]; then
	echo -e "CIS $cis152 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis152 \e[31m\e[1m\e[5mfailed\e[0m risky permissions detected on bootloader config /boot/grub2/grub.cfg"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		chown root:root /boot/grub2/grub.cfg
		chmod og-rwx /boot/grub2/grub.cfg
		if [[ $(stat /boot/grub2/grub.cfg | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0600/-rw-------)") ]]; then
			echo -e "CIS $cis152 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis152 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
fi
((ccis=ccis+1))

if [[ $(grep /sbin/sulogin /usr/lib/systemd/system/rescue.service | grep sulogin) ]]; then
	if [[ $(grep /sbin/sulogin /usr/lib/systemd/system/emergency.service | grep sulogin) ]]; then
		echo -e "CIS $cis153 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis153 \e[31m\e[1m\e[5mfailed\e[0m Authentication must be required for single user mode [file emergency.service 2 of 2]"
		if [[ $1 == "R" ]]; then
			if [[ $(cat /usr/lib/systemd/system/rescue.service | grep "ExecStart=" | wc | awk '{ if ($1==1) print $1}') ]]; then
				cp -rf /usr/lib/systemd/system/emergency.service /usr/lib/systemd/system/emergency.service.cis
				sed -i 's/ExecStart=.*/ExecStart=-\/bin\/sh -c "\/usr\/sbin\/sulogin; \/usr\/bin\/systemctl --job-mode=fail --no-block default"/' /usr/lib/systemd/system/emergency.service
				if [[ $(grep /sbin/sulogin /usr/lib/systemd/system/emergency.service | grep sulogin) ]]; then
					echo -e "CIS $cis153 remediation \e[32m\e[1msuccesful\e[0m [file emergency.service 2 of 2]"
				else
					echo -e "CIS $cis153 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually [file emergency.service 2 of 2]"
				fi
			else
				echo -e "CIS $cis153 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually [file emergency.service 2 of 2]"
			fi
		fi
		((cfcis=cfcis+1))
	fi
else
	echo -e "CIS $cis153 \e[31m\e[1m\e[5mfailed\e[0m Authentication must be required for single user mode [file rescue.service 1 of 2]"
	((cfcis=cfcis+1))

	if [[ $1 == "R" ]]; then
		if [[ $(cat /usr/lib/systemd/system/rescue.service | grep "ExecStart=" | wc | awk '{ if ($1==1) print $1}') ]]; then
			cp -rf /usr/lib/systemd/system/rescue.service /usr/lib/systemd/system/rescue.service.cis
			sed -i 's/ExecStart=.*/ExecStart=-\/bin\/sh -c "\/usr\/sbin\/sulogin; \/usr\/bin\/systemctl --job-mode=fail --no-block default"/' /usr/lib/systemd/system/rescue.service
			if [[ $(grep /sbin/sulogin /usr/lib/systemd/system/rescue.service | grep sulogin) ]]; then
				echo -e "CIS $cis153 remediation \e[32m\e[1msuccesful\e[0m [file rescue.service 1 of 2]"
			else
				echo -e "CIS $cis153 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually [file rescue.service 1 of 2]"
			fi
		else
			echo -e "CIS $cis153 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually [file rescue.service 1 of 2]"
		fi
	fi
fi
((ccis=ccis+1))

echo -e "###### Check CIS Controls 1.6 Additional Process Hardening ######"

if [[ $(grep "hard core" /etc/security/limits.conf) ]]; then
	if [[ $(sysctl fs.suid_dumpable | grep "fs.suid_dumpable = 0") ]]; then
		if [[ $(grep "fs.suid_dumpable" /etc/sysctl.conf | grep "fs.suid_dumpable = 0") ]]; then
			echo -e "CIS $cis161 \e[32m\e[1mpassed\e[0m"
		else
			((cfcis=cfcis+1))
			echo -e "CIS $cis161 \e[31m\e[1m\e[5mfailed\e[0m.  Check manually [file sysctl.conf 3 of 3]"
			if [[ $1 == "R" ]]; then
				echo "fs.suid_dumpable = 0" >> /etc/sysctl.conf
				sysctl -w fs.suid_dumpable=0
				if [[ $(grep "fs.suid_dumpable" /etc/sysctl.conf | grep "fs.suid_dumpable = 0") ]]; then
					echo -e "CIS $cis161 remediation \e[32m\e[1msuccesful\e[0m [file sysctl.conf 3 of 3]"
				else
					echo -e "CIS $cis161 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually [file sysctl.conf 3 of 3]"
				fi
			fi
		fi
	else
		echo -e "CIS $cis161 \e[31m\e[1m\e[5mfailed\e[0m [file systcl.conf 2 of 2]"
		((cfcis=cfcis+1))
		if [[ $1 == "R" ]]; then
			echo "fs.suid_dumpable = 0" >> /etc/sysctl.conf
			sysctl -w fs.suid_dumpable=0
			if [[ $(grep "fs.suid_dumpable" /etc/sysctl.conf | grep "fs.suid_dumpable = 0") ]]; then
				echo -e "CIS $cis161 remediation \e[32m\e[1msuccesful\e[0m [file limits.conf 2 of 3]"
			else
				echo -e "CIS $cis161 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually [file sysctl.conf 2 of 3]"
			fi
		fi
	fi
else
	echo -e "CIS $cis161 \e[31m\e[1m\e[5mfailed\e[0m Core dumps are restricted [file limits.conf 1 of 3]"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		echo "* hard core 0" >> /etc/security/limits.conf
		if [[ $(grep "hard core" /etc/security/limits.conf) ]]; then
			echo -e "CIS $cis161 remediation \e[32m\e[1msuccesful\e[0m [file limits.conf 1 of 3]"
		else
			echo -e "CIS $cis161 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually [file limits.conf 1 of 3]"
		fi
	fi
fi 
((ccis=ccis+1))

if [[ $(journalctl | grep 'protection: active') ]]; then
	echo -e "CIS $cis162 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis162 \e[31m\e[1m\e[5mfailed\e[0m XD/NX support must be enabled"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

if [[ $(sysctl kernel.randomize_va_space | grep "kernel.randomize_va_space = 2") ]]; then
	if [[ $(grep "kernel\.randomize_va_space" /etc/sysctl.conf /etc/sysctl.d/* | grep kernel.randomize_va_space) ]]; then
		echo -e "CIS $cis163 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis163 \e[31m\e[1m\e[5mfailed\e[0m Address space layout randomization (ASLR) must be enabled"
		((cfcis=cfcis+1))
		if [[ $1 == "R" ]]; then
			echo "kernel.randomize_va_space = 2" > /etc/sysctl.d/cis163_remediation
			sysctl -w kernel.randomize_va_space=2
			
			if [[ $(grep "kernel\.randomize_va_space" /etc/sysctl.conf /etc/sysctl.d/* | grep kernel.randomize_va_space) ]]; then
				echo -e "CIS $cis163 remediation \e[32m\e[1msuccesful\e[0m"
			else
				echo -e "CIS $cis163 \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		fi
	fi
else
	echo -e "CIS $cis163 \e[31m\e[1m\e[5mfailed\e[0m Address space layout randomization (ASLR) must be enabled"
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

if [[ $(rpm -q prelink | grep "is not installed") ]]; then
	echo -e "CIS $cis164 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis164 \e[31m\e[1m\e[5mfailed\e[0m prelink must be disabled"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		prelink -ua
		if [[ $(zypper -n remove prelink) ]]; then
			echo -e "CIS $cis164 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis164 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi
fi
((ccis=ccis+1))

echo -e "###### Check CIS Controls 1.7 Mandatory Access Control ######"

if [[ $(rpm -q apparmor-docs apparmor-parser apparmor-profiles apparmor-utils libapparmor1 | grep "armor" | wc | grep 5) ]]; then
	echo -e "CIS $cis1711 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis1711 \e[31m\e[1m\e[5mfailed\e[0m Apparmor must be installed"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		zypper install -t pattern apparmor
		if [[ $(rpm -q apparmor-docs apparmor-parser apparmor-profiles apparmor-utils libapparmor1 | grep "armor" | wc | grep 5) ]]; then
			echo -e "CIS $cis1711 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis1711 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi
fi
((ccis=ccis+1))

if [[ $(grep "^\s*linux" /boot/grub2/grub.cfg | grep -v "apparmor=1") ]]; then
	if [[ $(grep "^\s*linux" /boot/grub2/grub.cfg | grep -v "security=apparmor") ]]; then
		echo -e "CIS $cis1712 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis1712 \e[31m\e[1m\e[5mfailed\e[0m Apparmor is disabled in bootloader configuration"
		((cfcis=cfcis+1))
		if [[ $1 == "R" ]]; then
			sed -i 's/GRUB_CMDLINE_LINUX=.*/GRUB_CMDLINE_LINUX="security=apparmor apparmor=1"/' /etc/default/grub		
			grub2-mkconfig -o /boot/grub2/grub.cfg
			if [[ $(grep "^\s*linux" /boot/grub2/grub.cfg | grep -v "security=apparmor") ]]; then
				echo -e "CIS $cis1712 remediation \e[32m\e[1msuccesful\e[0m"
			else
				echo -e "CIS $cis1712 remediation \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		fi
	fi
else
	echo -e "CIS $cis1712 \e[31m\e[1m\e[5mfailed\e[0m Apparmor is disabled in bootloader configuration"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		sed -i 's/GRUB_CMDLINE_LINUX=.*/GRUB_CMDLINE_LINUX="security=apparmor apparmor=1"/' /etc/default/grub		
		grub2-mkconfig -o /boot/grub2/grub.cfg
		if [[ $(grep "^\s*linux" /boot/grub2/grub.cfg | grep -v "security=apparmor") ]]; then
			echo -e "CIS $cis1712 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis1712 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi
fi
((ccis=ccis+1))

if [[ $(apparmor_status | grep "0 profiles are in enforce mode"  | grep "0 profiles are in complain mode") ]]; then
	if [[ $(apparmor_status | grep "0 process are unconfined") ]]; then
		echo -e "CIS $cis1713 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis1713 \e[31m\e[1m\e[5mfailed\e[0m"
		aa-unconfined
		((cfcis=cfcis+1))
	fi
else
	echo -e "CIS $cis1713 \e[31m\e[1m\e[5mfailed\e[0m"
	if [[ $1 == "R" ]]; then
		aa-enforce /etc/apparmor.d/*	
		if [[ $(apparmor_status | grep "0 profiles are in enforce mode"  | grep "0 profiles are in complain mode") ]]; then
			echo -e "CIS $cis1712 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis1712 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

echo -e "###### Check CIS Controls 1.8 Warning Banners ######"

if [[ $(grep -E -i "(\\\v|\\\r|\\\m|\\\s|$(grep '^ID=' /etc/os-release | cut -d= -f2 | sed -e 's/"//g'))" /etc/motd) ]]; then
	echo -e "CIS $cis1811 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
else
	echo -e "CIS $cis1811 \e[32m\e[1mpassed\e[0m"
fi
((ccis=ccis+1))

if [[ $(grep -E -i "(\\\v|\\\r|\\\m|\\\s|$(grep '^ID=' /etc/os-release | cut -d= -f2 | sed -e 's/"//g'))" /etc/issue) ]]; then
    echo -e "CIS $cis1812 \e[31m\e[1m\e[5mfailed\e[0m"
	if [[ $1 == "R" ]]; then
		echo "CIS 1.8.1.2 Control -> Authorized uses only. All activity may be monitored and reported." > /etc/issue
		if [[ $(grep -E -i "(\\\v|\\\r|\\\m|\\\s|$(grep '^ID=' /etc/os-release | cut -d= -f2 | sed -e 's/"//g'))" /etc/issue) ]]; then
			echo -e "CIS $cis1812 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		else
			echo -e "CIS $cis1812 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi
	((cfcis=cfcis+1))
else
	echo -e "CIS $cis1812 \e[32m\e[1mpassed\e[0m"
fi
((ccis=ccis+1))

if [[ $(grep -E -i "(\\\v|\\\r|\\\m|\\\s|$(grep '^ID=' /etc/os-release | cut -d= -f2 | sed -e 's/"//g'))" /etc/issue.net) ]]; then
    echo -e "CIS $cis1813 \e[31m\e[1m\e[5mfailed\e[0m"
	if [[ $1 == "R" ]]; then
		echo "CIS 1.8.1.3 Control -> Authorized uses only. All activity may be monitored and reported." > /etc/issue.net
		if [[ $(grep -E -i "(\\\v|\\\r|\\\m|\\\s|$(grep '^ID=' /etc/os-release | cut -d= -f2 | sed -e 's/"//g'))" /etc/issue) ]]; then
			echo -e "CIS $cis1813 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		else
			echo -e "CIS $cis1813 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi
	((cfcis=cfcis+1))
else
    echo -e "CIS $cis1813 \e[32m\e[1mpassed\e[0m"
fi
((ccis=ccis+1))

if [[ $(stat /etc/motd | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0644") ]]; then
    echo -e "CIS $cis1814 \e[32m\e[1mpassed\e[0m"
else
    echo -e "CIS $cis1814 \e[31m\e[1m\e[5mfailed\e[0m"
	if [[ $1 == "R" ]]; then
		chown root:root /etc/motd
		chmod u-x,go-wx /etc/motd
		if [[ $(stat /etc/motd | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0644") ]]; then
			echo -e "CIS $cis1814 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		else
			echo -e "CIS $cis1814 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

if [[ $(stat /etc/issue | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0644") ]]; then
    echo -e "CIS $cis1815 \e[32m\e[1mpassed\e[0m"
else
    echo -e "CIS $cis1815 \e[31m\e[1m\e[5mfailed\e[0m"
	if [[ $1 == "R" ]]; then
		chown root:root /etc/issue
		chmod u-x,go-wx /etc/issue
		if [[ $(stat /etc/issue | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0644") ]]; then
			echo -e "CIS $cis1815 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		else
			echo -e "CIS $cis1815 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

if [[ $(stat /etc/issue.net | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0644") ]]; then
    echo -e "CIS $cis1816 \e[32m\e[1mpassed\e[0m"
else
    echo -e "CIS $cis1816 \e[31m\e[1m\e[5mfailed\e[0m"
	if [[ $1 == "R" ]]; then
		chown root:root /etc/issue.net
		chmod u-x,go-wx /etc/issue.net
		if [[ $(stat /etc/issue.net | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0644") ]]; then
			echo -e "CIS $cis1816 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		else
			echo -e "CIS $cis1816 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

echo -e "###### Check CIS Controls 1.9 Software Updates ######"

if [[ $(zypper list-updates | grep "No updates found") ]]; then
	echo -e "CIS $cis19 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis19 \e[31m\e[1m\e[5mfailed\e[0m"
	if [[ $1 == "R" ]]; then
		zypper update
		if [[ $(zypper list-updates | grep "No updates found") ]]; then
			echo -e "CIS $cis19 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		else
			echo -e "CIS $cis19 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

echo -e "###### Check CIS Controls 1.10 GDM removed or login configured ######"

if [[ $(cat /etc/dconf/profile/gdm | grep "user-db:user") ]]; then
	if [[ $(cat /etc/dconf/profile/gdm | grep "system-db:gdm") ]]; then
		if [[ $(cat /etc/dconf/profile/gdm | grep "file-db:") ]]; then
			if [[ $(cat /etc/dconf/db/gdm.d/* | grep "banner-message-enable") ]]; then
				echo -e "CIS $cis110 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis110 \e[31m\e[1m\e[5mfailed\e[0m"

				if [[ $1 == "R" ]]; then

					if [ -d /etc/dconf/db/gdm.d ]; then
  						echo "[org/gnome/login-screen]" > /etc/dconf/db/gdm.d/cis110_remediation
						echo "banner-message-enable=true" >> /etc/dconf/db/gdm.d/cis110_remediation
						echo "banner-message-text='CIS 1.10 Control -> Authorized uses only. All activity may be monitored and reported.'" >> /etc/dconf/db/gdm.d/cis110_remediation
					else
						mkdir /etc/dconf/db/gdm.d
						echo "[org/gnome/login-screen]" > /etc/dconf/db/gdm.d/cis110_remediation
						echo "banner-message-enable=true" >> /etc/dconf/db/gdm.d/cis110_remediation
						echo "banner-message-text='CIS 1.10 Control -> Authorized uses only. All activity may be monitored and reported.'" >> /etc/dconf/db/gdm.d/cis110_remediation
					fi
					dconf update

					if [[ $(cat /etc/dconf/db/gdm.d/* | grep "banner-message-enable") ]]; then
						echo -e "CIS $cis110 remediation \e[31m\e[1m\e[5mfailed\e[0m"
					else
						echo -e "CIS $cis110 remediation \e[32m\e[1msuccesful\e[0m"
					fi
				fi
				((cfcis=cfcis+1))
			fi
		else
			echo -e "CIS $cis110 \e[31m\e[1m\e[5mfailed\e[0m"

			if [[ $1 == "R" ]]; then
				if [ -f /etc/dconf/profile/gdm ]; then
					echo "file-db:/usr/share/gdm/greeter-dconf-defaults" >> /etc/dconf/profile/gdm
				else
					echo "user-db:user" > /etc/dconf/profile/gdm
					echo "system-db:gdm" >> /etc/dconf/profile/gdm
					echo "file-db:/usr/share/gdm/greeter-dconf-defaults" >> /etc/dconf/profile/gdm
				fi
				dconf update
				if [[ $(cat /etc/dconf/profile/gdm | grep "file-db:") ]]; then
					echo -e "CIS $cis110 remediation \e[31m\e[1m\e[5mfailed\e[0m"
				else
					echo -e "CIS $cis110 remediation \e[32m\e[1msuccesful\e[0m"
				fi
			fi
			((cfcis=cfcis+1))
		fi
	else
		echo -e "CIS $cis110 \e[31m\e[1m\e[5mfailed\e[0m"
		if [[ $1 == "R" ]]; then
			if [ -f /etc/dconf/profile/gdm ]; then
				echo "system-db:gdm" >> /etc/dconf/profile/gdm
			else
				echo "user-db:user" > /etc/dconf/profile/gdm
				echo "system-db:gdm" >> /etc/dconf/profile/gdm
				echo "file-db:/usr/share/gdm/greeter-dconf-defaults" >> /etc/dconf/profile/gdm
			fi
			dconf update

			if [[ $(cat /etc/dconf/profile/gdm | grep "system-db:gdm") ]]; then
				echo -e "CIS $cis110 remediation \e[31m\e[1m\e[5mfailed\e[0m"
			else
				echo -e "CIS $cis110 remediation \e[32m\e[1msuccesful\e[0m"
			fi
		fi
		((cfcis=cfcis+1))
	fi
else
	echo -e "CIS $cis110 \e[31m\e[1m\e[5mfailed\e[0m"
	
	if [[ $1 == "R" ]]; then
		if [ -f /etc/dconf/profile/gdm ]; then
			echo "user-db:user" > /etc/dconf/profile/gdm
		else
			echo "user-db:user" > /etc/dconf/profile/gdm
			echo "system-db:gdm" >> /etc/dconf/profile/gdm
			echo "file-db:/usr/share/gdm/greeter-dconf-defaults" >> /etc/dconf/profile/gdm
		fi
		dconf update

		if [[ $(cat /etc/dconf/profile/gdm | grep "user-db:user") ]]; then
			echo -e "CIS $cis110 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		else
			echo -e "CIS $cis110 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi
	((cfcis=cfcis+1))
fi
((ccis=ccis+1))

z=$((ccis-cfcis))
per=$(echo "scale=3 ; 100*$z/$ccis" | bc -l)

echo "Failed Controls $cfcis"
echo "Total Controls $ccis"
echo "Compliance Percent: $per %"

cfcis=0
c2cis=0

echo -e "###### Check CIS Controls 2.1 inetd services ######"

if [[ $(rpm -q xinetd | grep "not installed"2) ]]; then
	echo -e "CIS $cis211 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis211 \e[31m\e[1m\e[5mfailed\e[0m"
	if [[ $1 == "R" ]]; then
		zypper remove xinetd
		if [[ $(rpm -q xinetd | grep "not installed"2) ]]; then
			echo -e "CIS $cis211 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis211 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi
	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

echo -e "###### Check CIS Controls 2.2.1 Time Synchronization ######"

if [[ $(rpm -q chrony | grep "not installed") ]]; then
	echo -e "CIS $cis2211 \e[31m\e[1m\e[5mfailed\e[0m"
	if [[ $1 == "R" ]]; then
		zypper install chrony
		if [[ $(systemctl is-enabled systemd-timesyncd | grep "disabled") ]]; then
			echo -e "CIS $cis2211 \e[31m\e[1m\e[5mfailed\e[0m"
			((cfcis=cfcis+1))
			systemctl enable systemd-timesyncd
			if [[ $(systemctl is-enabled systemd-timesyncd | grep "disabled") ]]; then
				echo -e "CIS $cis2211 remediation \e[31m\e[1m\e[5mfailed\e[0m"
			else
				echo -e "CIS $cis2211 remediation \e[32m\e[1msuccesful\e[0m"
			fi
		else
			echo -e "CIS $cis2211 \e[32m\e[1mpassed\e[0m"
		fi
	fi
	((cfcis=cfcis+1))
else
	if [[ $(systemctl is-enabled systemd-timesyncd | grep "disabled") ]]; then
		echo -e "CIS $cis2211 \e[31m\e[1m\e[5mfailed\e[0m"
	
		if [[ $1 == "R" ]]; then
			zypper install chrony
			systemctl enable systemd-timesyncd

			if [[ $(systemctl is-enabled systemd-timesyncd | grep "disabled") ]]; then
				echo -e "CIS $cis2211 remediation \e[31m\e[1m\e[5mfailed\e[0m"
			else
				echo -e "CIS $cis2211 remediation \e[32m\e[1msuccesful\e[0m"
			fi
		fi
		((cfcis=cfcis+1))
	else
		echo -e "CIS $cis2211 \e[32m\e[1mpassed\e[0m"
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(systemctl is-enabled systemd-timesyncd.service | grep "disabled") ]]; then
	echo -e "CIS $cis2212 \e[31m\e[1m\e[5mfailed\e[0m"
	
	if [[ $1 == "R" ]]; then
		echo "NTP=172.26.5.101" >> /etc/systemd/timesyncd.conf
		echo "FallbackNTP=10.1.108.140" >> /etc/systemd/timesyncd.conf
		echo "RootDistanceMax=1" >> /etc/systemd/timesyncd.conf
		systemctl --now enable systemd-timesyncd.service
		timedatectl set-ntp true
			if [[ $(systemctl is-enabled systemd-timesyncd | grep "disabled") ]]; then
				echo -e "CIS $cis2212 remediation \e[31m\e[1m\e[5mfailed\e[0m"
			else
				echo -e "CIS $cis2212 remediation \e[32m\e[1msuccesful\e[0m"
			fi
	fi
	((cfcis=cfcis+1))
else
	echo -e "CIS $cis2212 \e[32m\e[1mpassed\e[0m"
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

echo -e "###### Check CIS Controls 2.2 special purpose services ######"

if [[ $(rpm -qa xorg-x11-server* | grep "is not installed") ]]; then
	echo -e "CIS $cis222 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis222 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q avahi | grep "is not installed") ]]; then
	echo -e "CIS $cis223 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis223 \e[31m\e[1m\e[5mfailed\e[0m"

	if [[ $1 == "R" ]]; then
		systemctl stop avahi-daemon.socket avahi-daemon.service
		zypper remove avahi
		if [[ $(rpm -q avahi | grep "is not installed") ]]; then
			echo -e "CIS $cis223 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		else
			echo -e "CIS $cis223 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi

	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q cups | grep "is not installed") ]]; then
	echo -e "CIS $cis224 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis224 \e[31m\e[1m\e[5mfailed\e[0m"

	if [[ $1 == "R" ]]; then
		zypper remove cups
		if [[ $(rpm -q cups | grep "is not installed") ]]; then
			echo -e "CIS $cis224 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		else
			echo -e "CIS $cis224 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi

	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q dhcp | grep "is not installed") ]]; then
	echo -e "CIS $cis225 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis225 \e[31m\e[1m\e[5mfailed\e[0m"

	if [[ $1 == "R" ]]; then
		zypper remove dhcp
		if [[ $(rpm -q dhcp | grep "is not installed")  ]]; then
			echo -e "CIS $cis225 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		else
			echo -e "CIS $cis225 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi

	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q openldap2 | grep "is not installed") ]]; then
	echo -e "CIS $cis226 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis226 \e[31m\e[1m\e[5mfailed\e[0m"

	if [[ $1 == "R" ]]; then
		zypper remove openldap2
		if [[ $(rpm -q rpm -q openldap2 | grep "is not installed")  ]]; then
			echo -e "CIS $cis226 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		else
			echo -e "CIS $cis226 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi

	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q rpcbind | grep "is not installed") ]]; then
	echo -e "CIS $cis228 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis228 \e[31m\e[1m\e[5mfailed\e[0m"

	if [[ $1 == "R" ]]; then
		zypper remove rpcbind
		if [[ $(rpm -q rpcbind | grep "is not installed") ]]; then
			echo -e "CIS $cis228 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		else
			echo -e "CIS $cis228 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi

	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q bind | grep "is not installed") ]]; then
	echo -e "CIS $cis229 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis229 \e[31m\e[1m\e[5mfailed\e[0m"

	if [[ $1 == "R" ]]; then
		zypper remove bind
		if [[ $(rpm -q bind | grep "is not installed") ]]; then
			echo -e "CIS $cis229 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		else
			echo -e "CIS $cis229 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi

	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q vsftpd | grep "is not installed") ]]; then
	echo -e "CIS $cis22_10 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis22_10 \e[31m\e[1m\e[5mfailed\e[0m"

	if [[ $1 == "R" ]]; then
		zypper remove vsftpd
		if [[ $(rpm -q vsftpd | grep "is not installed") ]]; then
			echo -e "CIS $cis22_10 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		else
			echo -e "CIS $cis22_10 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi

	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q dovecot | grep "is not installed") ]]; then
	echo -e "CIS $cis22_12 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis22_12 \e[31m\e[1m\e[5mfailed\e[0m"

	if [[ $1 == "R" ]]; then
		zypper remove dovecot
		if [[ $(rpm -q dovecot | grep "is not installed") ]]; then
			echo -e "CIS $cis22_12 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		else
			echo -e "CIS $cis22_12 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi

	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q samba | grep "is not installed") ]]; then
	echo -e "CIS $cis22_13 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis22_13 \e[31m\e[1m\e[5mfailed\e[0m"

	if [[ $1 == "R" ]]; then
		zypper remove samba
		if [[ $(rpm -q samba | grep "is not installed") ]]; then
			echo -e "CIS $cis22_13 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		else
			echo -e "CIS $cis22_13 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi

	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q squid | grep "is not installed") ]]; then
	echo -e "CIS $cis22_14 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis22_14 \e[31m\e[1m\e[5mfailed\e[0m"

	if [[ $1 == "R" ]]; then
		zypper remove squid
		if [[ $(rpm -q squid | grep "is not installed") ]]; then
			echo -e "CIS $cis22_14 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		else
			echo -e "CIS $cis22_14 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi

	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q net-snmp | grep "is not installed") ]]; then
	echo -e "CIS $cis22_15 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis22_15 \e[31m\e[1m\e[5mfailed\e[0m"

	if [[ $1 == "R" ]]; then
		zypper remove net-snmp
		if [[ $(rpm -q net-snmp | grep "is not installed") ]]; then
			echo -e "CIS $cis22_15 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		else
			echo -e "CIS $cis22_15 remediation \e[32m\e[1msuccesful\e[0m"
		fi
	fi

	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(ss -lntu | grep -E ':25\s' | grep -E -v '\s(127.0.0.1|\[?::1\]?):25\s') ]]; then
	echo -e "CIS $cis22_16 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
else
	echo -e "CIS $cis22_16 \e[32m\e[1mpassed\e[0m"
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q rsync | grep "is not installed") ]]; then
	echo -e "CIS $cis22_17 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis22_17 \e[31m\e[1m\e[5mfailed\e[0m"
	
	if [[ $1 == "R" ]]; then
		zypper remove rsync
		if [[ $(rpm -q rsync | grep "is not installed") ]]; then
			echo -e "CIS $cis22_17 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis22_17 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi

	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q ypserv | grep "not installed") ]]; then
	echo -e "CIS $cis22_18 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis22_18 \e[31m\e[1m\e[5mfailed\e[0m"
	
	if [[ $1 == "R" ]]; then
		zypper remove ypserv
		if [[ $(rpm -q ypserv | grep "is not installed") ]]; then
			echo -e "CIS $cis22_18 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis22_18 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi

	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q telnet-server | grep "not installed") ]]; then
	echo -e "CIS $cis22_19 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis22_19 \e[31m\e[1m\e[5mfailed\e[0m"
	
	if [[ $1 == "R" ]]; then
		zypper remove telnet-server
		if [[ $(rpm -q telnet-server | grep "is not installed") ]]; then
			echo -e "CIS $cis22_19 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis22_19 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi

	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

echo -e "###### Check CIS Controls 2.3 service clients ######"

if [[ $(rpm -q ypbind | grep "not installed") ]]; then
	echo -e "CIS $cis231 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis231 \e[31m\e[1m\e[5mfailed\e[0m"
	
	if [[ $1 == "R" ]]; then
		zypper remove ypbind
		if [[ $(rpm -q ypbind | grep "is not installed") ]]; then
			echo -e "CIS $cis231 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis231 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi

	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q rsh  | grep "not installed") ]]; then
	echo -e "CIS $cis232 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis232 \e[31m\e[1m\e[5mfailed\e[0m"
	
	if [[ $1 == "R" ]]; then
		zypper remove rsh
		if [[ $(rpm -q rsh | grep "is not installed") ]]; then
			echo -e "CIS $cis232 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis232 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi

	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q talk  | grep "not installed") ]]; then
	echo -e "CIS $cis233 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis233 \e[31m\e[1m\e[5mfailed\e[0m"
	
	if [[ $1 == "R" ]]; then
		zypper remove talk
		if [[ $(rpm -q talk | grep "is not installed") ]]; then
			echo -e "CIS $cis233 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis233 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi

	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q telnet  | grep "not installed") ]]; then
	echo -e "CIS $cis234 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis234 \e[31m\e[1m\e[5mfailed\e[0m"
	
	if [[ $1 == "R" ]]; then
		zypper remove telnet
		if [[ $(rpm -q telnet | grep "is not installed") ]]; then
			echo -e "CIS $cis234 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis234 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi

	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q openldap2-client  | grep "not installed") ]]; then
	echo -e "CIS $cis235 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis235 \e[31m\e[1m\e[5mfailed\e[0m"
	
	if [[ $1 == "R" ]]; then
		zypper remove openldap2-client
		if [[ $(rpm -q openldap2-client | openldap2-client "is not installed") ]]; then
			echo -e "CIS $cis235 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis235 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi

	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

echo -e "###### Check CIS Controls 2.4 Ensure nonessential services are removed or masked ######"
echo -e "###### This is a manual check run lsof -i -P -n | grep -v 'ESTABLISHED' ######"

z=$((c2cis-cfcis))
per=$(echo "scale=3 ; 100*$z/$c2cis" | bc -l)

echo "Failed Controls $cfcis"
echo "Total Controls $c2cis"
echo "Compliance Percent: $per %"

c2cis=0
cfcis=0

echo -e "###### Check CIS Controls 3.1 Disable unused network protocols and devices ######"

if [[ $(ip link show up | grep "wlan") ]]; then
	echo -e "CIS $cis312 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
else
	echo -e "CIS $cis312 \e[32m\e[1mpassed\e[0m"
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

echo -e "###### Check CIS Controls 3.2 Network Parameters ######"

if [[ $(sysctl net.ipv4.ip_forward | grep "ip_forward = 0") ]]; then
	if [[ $(grep -E -s "^\s*net\.ipv4\.ip_forward\s*=\s*1" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf) ]]; then
		echo -e "CIS $cis321 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))

		if [[ $1 == "R" ]]; then
		grep -Els "^\s*net\.ipv4\.ip_forward\s*=\s*1" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf | while read filename; do sed -ri "s/^\s*(net\.ipv4\.ip_forward\s*)(=)(\s*\S+\b).*$/# *REMOVED* \1/" $filename; done; sysctl -w net.ipv4.ip_forward=0; sysctl -w net.ipv4.route.flush=1
			if [[ $(sysctl net.ipv4.ip_forward | grep "ip_forward = 0") ]]; then
				echo -e "CIS $cis321 remediation \e[32m\e[1msuccesful\e[0m"
			else
				echo -e "CIS $cis321 remediation \e[31m\e[1m\e[5mfailed\e[0m"
			fi
		fi
	else
		
		echo -e "CIS $cis321 \e[32m\e[1mpassed\e[0m"
	fi	
else
	echo -e "CIS $cis321 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))

	if [[ $1 == "R" ]]; then
		grep -Els "^\s*net\.ipv4\.ip_forward\s*=\s*1" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf | while read filename; do sed -ri "s/^\s*(net\.ipv4\.ip_forward\s*)(=)(\s*\S+\b).*$/# *REMOVED* \1/" $filename; done; sysctl -w net.ipv4.ip_forward=0; sysctl -w net.ipv4.route.flush=1
		if [[ $(sysctl net.ipv4.ip_forward | grep "ip_forward = 0") ]]; then
			echo -e "CIS $cis321 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis321 remediation \e[31m\e[1m\e[5mfailed\e[0m"
		fi
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(sysctl net.ipv4.conf.all.send_redirects | grep "send_redirects = 0") ]]; then
	if [[ $(sysctl net.ipv4.conf.default.send_redirects | grep "send_redirects = 0") ]]; then
		if [[ $(grep "net\.ipv4\.conf\.all\.send_redirects" /etc/sysctl.conf /etc/sysctl.d/*) ]]; then 
			if [[ $(grep "net\.ipv4\.conf\.default\.send_redirects" /etc/sysctl.conf /etc/sysctl.d/*) ]]; then
				echo -e "CIS $cis322 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis322 \e[31m\e[1m\e[5mfailed\e[0m"
				((cfcis=cfcis+1))

				if [[ $1 == "R" ]]; then

					echo "net.ipv4.conf.default.send_redirects = 0" >> /etc/sysctl.d/cis322_remediation
					echo "net.ipv4.conf.all.send_redirects = 0" >> /etc/sysctl.d/cis322_remediation

					sysctl -w net.ipv4.conf.all.send_redirects=0
					sysctl -w net.ipv4.conf.default.send_redirects=0
					sysctl -w net.ipv4.route.flush=1
				fi
			fi
		else
			echo -e "CIS $cis312 \e[31m\e[1m\e[5mfailed\e[0m"
			((cfcis=cfcis+1))

			if [[ $1 == "R" ]]; then
				echo "net.ipv4.conf.default.send_redirects = 0" >> /etc/sysctl.d/cis322_remediation
				echo "net.ipv4.conf.all.send_redirects = 0" >> /etc/sysctl.d/cis322_remediation

				sysctl -w net.ipv4.conf.all.send_redirects=0
				sysctl -w net.ipv4.conf.default.send_redirects=0
				sysctl -w net.ipv4.route.flush=1
			fi
		fi
	else
		echo -e "CIS $cis312 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))

		if [[ $1 == "R" ]]; then
			echo "net.ipv4.conf.default.send_redirects = 0" >> /etc/sysctl.d/cis322_remediation
			echo "net.ipv4.conf.all.send_redirects = 0" >> /etc/sysctl.d/cis322_remediation

			sysctl -w net.ipv4.conf.all.send_redirects=0
			sysctl -w net.ipv4.conf.default.send_redirects=0
			sysctl -w net.ipv4.route.flush=1
		fi

	fi
else
	echo -e "CIS $cis312 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))

	if [[ $1 == "R" ]]; then
		echo "net.ipv4.conf.default.send_redirects = 0" >> /etc/sysctl.d/cis322_remediation
		echo "net.ipv4.conf.all.send_redirects = 0" >> /etc/sysctl.d/cis322_remediation

		sysctl -w net.ipv4.conf.all.send_redirects=0
		sysctl -w net.ipv4.conf.default.send_redirects=0
		sysctl -w net.ipv4.route.flush=1
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

echo -e "###### Check CIS Controls 3.3 Host and Router Network Parameters ######"

if [[ $(sysctl net.ipv4.conf.all.accept_source_route | grep "accept_source_route = 0") ]]; then
	if [[ $(sysctl net.ipv4.conf.default.accept_source_route | grep "accept_source_route = 0") ]]; then
	
		if [[ $(grep "net\.ipv4\.conf\.all\.accept_source_route" /etc/sysctl.conf /etc/sysctl.d/*) ]]; then
			if [[ $(grep "net\.ipv4\.conf\.default\.accept_source_route" /etc/sysctl.conf /etc/sysctl.d/*) ]]; then
				echo -e "CIS $cis331 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis331 \e[31m\e[1m\e[5mfailed\e[0m"

				((cfcis=cfcis+1))

				if [[ $1 == "R" ]]; then
					echo "net.ipv4.conf.all.accept_source_route = 0" >> /etc/sysctl.d/cis331_remediation
					echo "net.ipv4.conf.default.accept_source_route = 0" >> /etc/sysctl.d/cis331_remediation

					sysctl -w net.ipv4.conf.all.accept_source_route=0
					sysctl -w net.ipv4.conf.default.accept_source_route=0
					sysctl -w net.ipv4.route.flush=1
				fi
			fi
		else
			echo -e "CIS $cis331 \e[31m\e[1m\e[5mfailed\e[0m"
			((cfcis=cfcis+1))

			if [[ $1 == "R" ]]; then
				echo "net.ipv4.conf.all.accept_source_route = 0" >> /etc/sysctl.d/cis331_remediation
				echo "net.ipv4.conf.default.accept_source_route = 0" >> /etc/sysctl.d/cis331_remediation

				sysctl -w net.ipv4.conf.all.accept_source_route=0
				sysctl -w net.ipv4.conf.default.accept_source_route=0
				sysctl -w net.ipv4.route.flush=1
			fi
		fi
	else
		echo -e "CIS $cis331 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))

		if [[ $1 == "R" ]]; then
			echo "net.ipv4.conf.all.accept_source_route = 0" >> /etc/sysctl.d/cis331_remediation
			echo "net.ipv4.conf.default.accept_source_route = 0" >> /etc/sysctl.d/cis331_remediation

			sysctl -w net.ipv4.conf.all.accept_source_route=0
			sysctl -w net.ipv4.conf.default.accept_source_route=0
			sysctl -w net.ipv4.route.flush=1
		fi
	fi
else
	echo -e "CIS $cis331 \e[31m\e[1m\e[5mfailed\e[0m"

	((cfcis=cfcis+1))

	if [[ $1 == "R" ]]; then
		echo "net.ipv4.conf.all.accept_source_route = 0" >> /etc/sysctl.d/cis331_remediation
		echo "net.ipv4.conf.default.accept_source_route = 0" >> /etc/sysctl.d/cis331_remediation

		sysctl -w net.ipv4.conf.all.accept_source_route=0
		sysctl -w net.ipv4.conf.default.accept_source_route=0
		sysctl -w net.ipv4.route.flush=1
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(sysctl net.ipv4.conf.all.accept_redirects | grep "accept_redirects = 0") ]]; then
	if [[ $(sysctl net.ipv4.conf.default.accept_redirects | grep "accept_redirects = 0") ]]; then
		if [[ $(grep "net\.ipv4\.conf\.all\.accept_redirects" /etc/sysctl.conf /etc/sysctl.d/*) ]]; then	
			if [[ $(grep "net\.ipv4\.conf\.default\.accept_redirects" /etc/sysctl.conf /etc/sysctl.d/*) ]]; then
				echo -e "CIS $cis332 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis332 \e[31m\e[1m\e[5mfailed\e[0m"
				((cfcis=cfcis+1))
				if [[ $1 == "R" ]]; then
					echo "net.ipv4.conf.all.accept_redirects = 0" >> /etc/sysctl.d/cis332_remediation
					echo "net.ipv4.conf.default.accept_redirects = 0" >> /etc/sysctl.d/cis332_remediation

					sysctl -w net.ipv4.conf.all.accept_redirects=0
					sysctl -w net.ipv4.conf.default.accept_redirects=0
					sysctl -w net.ipv4.route.flush=1
				fi
			fi
		else
			echo -e "CIS $cis332 \e[31m\e[1m\e[5mfailed\e[0m"
			((cfcis=cfcis+1))
			if [[ $1 == "R" ]]; then
				echo "net.ipv4.conf.all.accept_redirects = 0" >> /etc/sysctl.d/cis332_remediation
				echo "net.ipv4.conf.default.accept_redirects = 0" >> /etc/sysctl.d/cis332_remediation

				sysctl -w net.ipv4.conf.all.accept_redirects=0
				sysctl -w net.ipv4.conf.default.accept_redirects=0
				sysctl -w net.ipv4.route.flush=1
			fi
		fi
	else
		echo -e "CIS $cis332 \e[31m\e[1m\e[5mfailed\e[0m"

		((cfcis=cfcis+1))
		if [[ $1 == "R" ]]; then
			echo "net.ipv4.conf.all.accept_redirects = 0" >> /etc/sysctl.d/cis332_remediation
			echo "net.ipv4.conf.default.accept_redirects = 0" >> /etc/sysctl.d/cis332_remediation

			sysctl -w net.ipv4.conf.all.accept_redirects=0
			sysctl -w net.ipv4.conf.default.accept_redirects=0
			sysctl -w net.ipv4.route.flush=1
		fi
	fi
else
	echo -e "CIS $cis332 \e[31m\e[1m\e[5mfailed\e[0m"

	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		echo "net.ipv4.conf.all.accept_redirects = 0" >> /etc/sysctl.d/cis332_remediation
		echo "net.ipv4.conf.default.accept_redirects = 0" >> /etc/sysctl.d/cis332_remediation

		sysctl -w net.ipv4.conf.all.accept_redirects=0
		sysctl -w net.ipv4.conf.default.accept_redirects=0
		sysctl -w net.ipv4.route.flush=1
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(sysctl net.ipv4.conf.all.secure_redirects | grep "secure_redirects = 0") ]]; then
	if [[ $(sysctl net.ipv4.conf.default.secure_redirects | grep "secure_redirects = 0") ]]; then
		if [[ $(grep "net\.ipv4\.conf\.all\.secure_redirects" /etc/sysctl.conf /etc/sysctl.d/*) ]]; then	
			if [[ $(grep "net\.ipv4\.conf\.default\.secure_redirects" /etc/sysctl.conf /etc/sysctl.d/*) ]]; then
				echo -e "CIS $cis333 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis333 \e[31m\e[1m\e[5mfailed\e[0m"
				((cfcis=cfcis+1))
				if [[ $1 == "R" ]]; then
					echo "net.ipv4.conf.all.secure_redirects = 0" >> /etc/sysctl.d/cis333_remediation
					echo "net.ipv4.conf.default.secure_redirects = 0" >> /etc/sysctl.d/cis333_remediation

					sysctl -w net.ipv4.conf.all.secure_redirects=0
					sysctl -w net.ipv4.conf.default.secure_redirects=0
					sysctl -w net.ipv4.route.flush=1
				fi
			fi
		else
			echo -e "CIS $cis333 \e[31m\e[1m\e[5mfailed\e[0m"
			((cfcis=cfcis+1))
			if [[ $1 == "R" ]]; then
				echo "net.ipv4.conf.all.secure_redirects = 0" >> /etc/sysctl.d/cis333_remediation
				echo "net.ipv4.conf.default.secure_redirects = 0" >> /etc/sysctl.d/cis333_remediation

				sysctl -w net.ipv4.conf.all.secure_redirects=0
				sysctl -w net.ipv4.conf.default.secure_redirects=0
				sysctl -w net.ipv4.route.flush=1
			fi
		fi
	else
		echo -e "CIS $cis333 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
		if [[ $1 == "R" ]]; then
			echo "net.ipv4.conf.all.secure_redirects = 0" >> /etc/sysctl.d/cis333_remediation
			echo "net.ipv4.conf.default.secure_redirects = 0" >> /etc/sysctl.d/cis333_remediation

			sysctl -w net.ipv4.conf.all.secure_redirects=0
			sysctl -w net.ipv4.conf.default.secure_redirects=0
			sysctl -w net.ipv4.route.flush=1
		fi
	fi
else
	echo -e "CIS $cis333 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		echo "net.ipv4.conf.all.secure_redirects = 0" >> /etc/sysctl.d/cis333_remediation
		echo "net.ipv4.conf.default.secure_redirects = 0" >> /etc/sysctl.d/cis333_remediation

		sysctl -w net.ipv4.conf.all.secure_redirects=0
		sysctl -w net.ipv4.conf.default.secure_redirects=0
		sysctl -w net.ipv4.route.flush=1
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(sysctl net.ipv4.conf.all.log_martians | grep "log_martians = 1") ]]; then
	if [[ $(sysctl net.ipv4.conf.default.log_martians | grep "log_martians = 1") ]]; then
		if [[ $(grep "net\.ipv4\.conf\.all\.log_martians" /etc/sysctl.conf /etc/sysctl.d/*) ]]; then
			if [[ $(grep "grep "net\.ipv4\.conf\.default\.log_martians" /etc/sysctl.conf /etc/sysctl.d/*" /etc/sysctl.conf) ]]; then
				echo -e "CIS $cis334 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis334 \e[31m\e[1m\e[5mfailed\e[0m"

				((cfcis=cfcis+1))
				if [[ $1 == "R" ]]; then
					echo "net.ipv4.conf.all.log_martians = 1" >> /etc/sysctl.d/cis334_remediation
					echo "net.ipv4.conf.default.log_martians = 1" >> /etc/sysctl.d/cis334_remediation

					sysctl -w net.ipv4.conf.all.log_martians=1
					sysctl -w net.ipv4.conf.default.log_martians=1
					sysctl -w net.ipv4.route.flush=1
				fi
			fi
		else
			echo -e "CIS $cis334 \e[31m\e[1m\e[5mfailed\e[0m"
			((cfcis=cfcis+1))
			if [[ $1 == "R" ]]; then
				echo "net.ipv4.conf.all.log_martians = 1" >> /etc/sysctl.d/cis334_remediation
				echo "net.ipv4.conf.default.log_martians = 1" >> /etc/sysctl.d/cis334_remediation

				sysctl -w net.ipv4.conf.all.log_martians=1
				sysctl -w net.ipv4.conf.default.log_martians=1
				sysctl -w net.ipv4.route.flush=1
			fi
		fi
	else
		echo -e "CIS $cis334 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
		if [[ $1 == "R" ]]; then
			echo "net.ipv4.conf.all.log_martians = 1" >> /etc/sysctl.d/cis334_remediation
			echo "net.ipv4.conf.default.log_martians = 1" >> /etc/sysctl.d/cis334_remediation

			sysctl -w net.ipv4.conf.all.log_martians=1
			sysctl -w net.ipv4.conf.default.log_martians=1
			sysctl -w net.ipv4.route.flush=1
		fi
	fi
else
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		echo "net.ipv4.conf.all.log_martians = 1" >> /etc/sysctl.d/cis334_remediation
		echo "net.ipv4.conf.default.log_martians = 1" >> /etc/sysctl.d/cis334_remediation

		sysctl -w net.ipv4.conf.all.log_martians=1
		sysctl -w net.ipv4.conf.default.log_martians=1
		sysctl -w net.ipv4.route.flush=1
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(sysctl net.ipv4.icmp_echo_ignore_broadcasts | grep "icmp_echo_ignore_broadcasts = 1") ]]; then
	if [[ $(grep "net\.ipv4\.icmp_echo_ignore_broadcasts" /etc/sysctl.conf /etc/sysctl.d/*) ]]; then
		echo -e "CIS $cis335 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis335 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
		if [[ $1 == "R" ]]; then
			echo "net.ipv4.icmp_echo_ignore_broadcasts = 1" >> /etc/sysctl.d/cis335_remediation
			sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1
			sysctl -w net.ipv4.route.flush=1
		fi
	fi	
else
	echo -e "CIS $cis335 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		echo "net.ipv4.icmp_echo_ignore_broadcasts = 1" >> /etc/sysctl.d/cis335_remediation
		sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1
		sysctl -w net.ipv4.route.flush=1
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(sysctl net.ipv4.icmp_ignore_bogus_error_responses | grep "icmp_ignore_bogus_error_responses = 1") ]]; then
	if [[ $(grep "net.ipv4.icmp_ignore_bogus_error_responses" /etc/sysctl.conf /etc/sysctl.d/*) ]]; then
		echo -e "CIS $cis336 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis336 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
		if [[ $1 == "R" ]]; then
			echo "net.ipv4.icmp_ignore_bogus_error_responses = 1" >> /etc/sysctl.d/cis336_remediation
			sysctl -w net.ipv4.icmp_ignore_bogus_error_responses=1
			sysctl -w net.ipv4.route.flush=1
		fi
	fi	
else
	echo -e "CIS $cis336 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		echo "net.ipv4.icmp_ignore_bogus_error_responses = 1" >> /etc/sysctl.d/cis336_remediation
		sysctl -w net.ipv4.icmp_ignore_bogus_error_responses=1
		sysctl -w net.ipv4.route.flush=1
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(sysctl net.ipv4.conf.all.rp_filter | grep "rp_filter = 1") ]]; then
	if [[ $(sysctl net.ipv4.conf.default.rp_filter | grep "rp_filter = 1") ]]; then
		if [[ $(grep "net\.ipv4\.conf\.all\.rp_filter" /etc/sysctl.conf /etc/sysctl.d/*) ]]; then
			if [[ $(grep "net\.ipv4\.conf\.default\.rp_filter" /etc/sysctl.conf /etc/sysctl.d/*) ]]; then
				echo -e "CIS $cis337 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis337 \e[31m\e[1m\e[5mfailed\e[0m"
				((cfcis=cfcis+1))
				if [[ $1 == "R" ]]; then
					echo "net.ipv4.conf.all.rp_filter = 1" >> /etc/sysctl.d/cis337_remediation
					echo "net.ipv4.conf.default.rp_filter = 1" >> /etc/sysctl.d/cis337_remediation
					sysctl -w net.ipv4.conf.all.rp_filter=1
					sysctl -w net.ipv4.conf.default.rp_filter=1
					sysctl -w net.ipv4.route.flush=1
				fi
			fi
		else
			echo -e "CIS $cis337 \e[31m\e[1m\e[5mfailed\e[0m"
			((cfcis=cfcis+1))
			if [[ $1 == "R" ]]; then
				echo "net.ipv4.conf.all.rp_filter = 1" >> /etc/sysctl.d/cis337_remediation
				echo "net.ipv4.conf.default.rp_filter = 1" >> /etc/sysctl.d/cis337_remediation
				sysctl -w net.ipv4.conf.all.rp_filter=1
				sysctl -w net.ipv4.conf.default.rp_filter=1
				sysctl -w net.ipv4.route.flush=1
			fi
		fi
	else
		echo -e "CIS $cis337 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
		if [[ $1 == "R" ]]; then
			echo "net.ipv4.conf.all.rp_filter = 1" >> /etc/sysctl.d/cis337_remediation
			echo "net.ipv4.conf.default.rp_filter = 1" >> /etc/sysctl.d/cis337_remediation
			sysctl -w net.ipv4.conf.all.rp_filter=1
			sysctl -w net.ipv4.conf.default.rp_filter=1
			sysctl -w net.ipv4.route.flush=1
		fi
	fi
else
	echo -e "CIS $cis337 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		echo "net.ipv4.conf.all.rp_filter = 1" >> /etc/sysctl.d/cis337_remediation
		echo "net.ipv4.conf.default.rp_filter = 1" >> /etc/sysctl.d/cis337_remediation
		sysctl -w net.ipv4.conf.all.rp_filter=1
		sysctl -w net.ipv4.conf.default.rp_filter=1
		sysctl -w net.ipv4.route.flush=1
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(sysctl net.ipv4.tcp_syncookies | grep "tcp_syncookies = 1") ]]; then
	if [[ $(grep "net\.ipv4\.tcp_syncookies" /etc/sysctl.conf /etc/sysctl.d/*) ]]; then
		echo -e "CIS $cis338 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis338 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
		if [[ $1 == "R" ]]; then
			echo "net.ipv4.tcp_syncookies = 1" >> /etc/sysctl.d/cis338_remediation
			sysctl -w net.ipv4.tcp_syncookies=1
			sysctl -w net.ipv4.route.flush=1
		fi
	fi	
else
	echo -e "CIS $cis338 \e[31m\e[1m\e[5mfailed\e[0m"
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(sysctl net.ipv6.conf.all.accept_ra | grep "accept_ra = 0") ]]; then
	if [[ $(sysctl net.ipv6.conf.default.accept_ra | grep "accept_ra = 0") ]]; then
		if [[ $(grep "net.ipv6.conf.all.accept_ra = 0" /etc/sysctl.conf) ]]; then
			if [[ $(grep "net.ipv6.conf.default.accept_ra = 0" /etc/sysctl.conf) ]]; then
				echo -e "CIS $cis339 \e[32m\e[1mpassed\e[0m"
			else
				echo -e "CIS $cis339 \e[31m\e[1m\e[5mfailed\e[0m"
				((cfcis=cfcis+1))
				if [[ $1 == "R" ]]; then
					echo "net.ipv6.conf.all.accept_ra = 0" >> /etc/sysctl.d/cis339_remediation
					echo "net.ipv6.conf.default.accept_ra = 0" >> /etc/sysctl.d/cis339_remediation
					sysctl -w net.ipv6.conf.all.accept_ra=0
					sysctl -w net.ipv6.conf.default.accept_ra=0
					sysctl -w net.ipv4.route.flush=1
				fi
			fi
		else
			echo -e "CIS $cis339 \e[31m\e[1m\e[5mfailed\e[0m"
			((cfcis=cfcis+1))
			if [[ $1 == "R" ]]; then
				echo "net.ipv6.conf.all.accept_ra = 0" >> /etc/sysctl.d/cis339_remediation
				echo "net.ipv6.conf.default.accept_ra = 0" >> /etc/sysctl.d/cis339_remediation
				sysctl -w net.ipv6.conf.all.accept_ra=0
				sysctl -w net.ipv6.conf.default.accept_ra=0
				sysctl -w net.ipv4.route.flush=1
			fi
		fi
	else
		echo -e "CIS $cis339 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
		if [[ $1 == "R" ]]; then
			echo "net.ipv6.conf.all.accept_ra = 0" >> /etc/sysctl.d/cis339_remediation
			echo "net.ipv6.conf.default.accept_ra = 0" >> /etc/sysctl.d/cis339_remediation
			sysctl -w net.ipv6.conf.all.accept_ra=0
			sysctl -w net.ipv6.conf.default.accept_ra=0
			sysctl -w net.ipv4.route.flush=1
		fi
	fi
else
	echo -e "CIS $cis339 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		echo "net.ipv6.conf.all.accept_ra = 0" >> /etc/sysctl.d/cis339_remediation
		echo "net.ipv6.conf.default.accept_ra = 0" >> /etc/sysctl.d/cis339_remediation
		sysctl -w net.ipv6.conf.all.accept_ra=0
		sysctl -w net.ipv6.conf.default.accept_ra=0
		sysctl -w net.ipv4.route.flush=1
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

echo -e "###### Check CIS Controls 3.5 Firewall Configuration ######"

if [[ $(rpm -q firewalld iptables | grep "is not installed") ]]; then
	echo -e "CIS $cis3511\e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
else
	echo -e "CIS $cis3511 \e[32m\e[1mpassed\e[0m"
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q nftables | grep "is not installed") ]]; then
	echo -e "CIS $cis3512 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis3512\e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(systemctl is-enabled firewalld | grep "enabled") ]]; then
	if [[ $(systemctl is-enabled firewalld | grep "not running") ]]; then
		echo -e "CIS $cis3513\e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	else
		echo -e "CIS $cis3513 \e[32m\e[1mpassed\e[0m"
	fi
else
	echo -e "CIS $cis3513\e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(firewall-cmd --get-default-zone | grep "FirewallD is not running") ]]; then
	echo -e "CIS $cis3514\e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
else
	echo -e "CIS $cis3514 \e[32m\e[1mpassed\e[0m"
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(firewall-cmd --get-default-zone | grep "FirewallD is not running") ]]; then
	echo -e "CIS $cis3514\e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
else
	echo -e "CIS $cis3514 \e[32m\e[1mpassed\e[0m"
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(firewall-cmd --get-active-zones | awk '!/:/ {print $1}' | while read ZN; do firewall-cmd --list-all --zone=$ZN; done | grep "FirewallD is not running") ]]; then
	echo -e "CIS $cis3516\e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
else
	echo -e "CIS $cis3516 \e[32m\e[1mpassed\e[0m"
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q iptables | grep "is not installed") ]]; then
	echo -e "CIS $cis35311\e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
else
	echo -e "CIS $cis35311 \e[32m\e[1mpassed\e[0m"
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q nftables | grep "is not installed") ]]; then
	echo -e "CIS $cis35312 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis35312\e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(rpm -q rpm -q firewalld | grep "is not installed") ]]; then
	echo -e "CIS $cis35313 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis35313\e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $( iptables -L | grep INPUT | grep DROP) ]]; then
	if [[ $( iptables -L | grep FORWARD | grep DROP) ]]; then
		if [[ $( iptables -L | grep OUPUT | grep DROP) ]]; then
			echo -e "CIS $cis35321 \e[32m\e[1mpassed\e[0m"
		else
			echo -e "CIS $cis35321\e[31m\e[1m\e[5mfailed\e[0m"
			((cfcis=cfcis+1))
		fi
	else
		echo -e "CIS $cis35321\e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi
else
	echo -e "CIS $cis35321\e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(iptables -L | grep INPUT | grep DROP) ]]; then
	if [[ $(iptables -L | grep FORWARD | grep DROP) ]]; then
		if [[ $(iptables -L | grep OUPUT | grep DROP) ]]; then
			echo -e "CIS $cis35321 \e[32m\e[1mpassed\e[0m"
		else
			echo -e "CIS $cis35321\e[31m\e[1m\e[5mfailed\e[0m"
			((cfcis=cfcis+1))
		fi
	else
		echo -e "CIS $cis35321\e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi
else
	echo -e "CIS $cis35321\e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(iptables -L INPUT -v -n | grep "lo") ]]; then
	if [[ $(iptables -L OUTPUT -v -n | grep "lo") ]]; then
		echo -e "CIS $cis35322 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis35322\e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi
else
	echo -e "CIS $cis35322\e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

z=$((c2cis-cfcis))
per=$(echo "scale=3 ; 100*$z/$c2cis" | bc -l)

echo "Failed Controls $cfcis"
echo "Total Controls $c2cis"
echo "Compliance Percent: $per %"

cfcis=0
c2cis=0

echo -e "###### Check CIS Controls 4.2 Configure Logging ######"

if [[ $(rpm -q rsyslog | grep "is not installed") ]]; then
	echo -e "CIS $cis4211 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))

	if [[ $1 == "R" ]]; then
		zypper install rsyslog
		if [[ $(rpm -q rsyslog | grep "is not installed") ]]; then
			echo -e "CIS $cis4211 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis4211 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi

else
	echo -e "CIS $cis4211 \e[32m\e[1mpassed\e[0m"
fi
((c2cis=c2cis+1))
((ccis=ccis+1))


if [[ $(systemctl is-enabled rsyslog | grep "enabled") ]]; then
	if [[ $(systemctl status rsyslog | grep 'active (running) ') ]]; then
		echo -e "CIS $cis4212 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis4212 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
		if [[ $1 == "R" ]]; then
			systemctl start rsyslog
			if [[ $(systemctl is-enabled rsyslog | grep "enabled") ]]; then
				echo -e "CIS $cis4212 remediation \e[32m\e[1msuccesful\e[0m"
			else
				echo -e "CIS $cis4212 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
			fi
		fi
	fi
else
	echo -e "CIS $cis4212 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		systemctl --now enable rsyslog
		if [[ $(systemctl is-enabled rsyslog | grep "enabled") ]]; then
			echo -e "CIS $cis4212 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis4212 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(grep ^\$FileCreateMode /etc/rsyslog.conf /etc/rsyslog.d/*.conf | grep "640") ]]; then
	echo -e "CIS $cis4213 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis4213 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		echo "$FileCreateMode 0640" > /etc/rsyslog.d/cis4213_remediation
		if [[ $(grep ^\$FileCreateMode /etc/rsyslog.conf /etc/rsyslog.d/*.conf | grep "640") ]]; then
			echo -e "CIS $cis4213 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis4213 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(grep "^*.*[^I][^I]*@" /etc/rsyslog.conf /etc/rsyslog.d/*.conf) ]]; then
	echo -e "CIS $cis4215 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis4215 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(grep '$ModLoad imtcp' /etc/rsyslog.conf /etc/rsyslog.d/*.conf | grep "\#\$ModLoad") ]]; then
	if [[ $( grep '$InputTCPServerRun' /etc/rsyslog.conf /etc/rsyslog.d/*.conf | grep "\#\$InputTCP") ]]; then
		echo -e "CIS $cis4216 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis4216 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi
else
	echo -e "CIS $cis4216 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(grep -E ^\s*ForwardToSyslog /etc/systemd/journald.conf | grep "ForwardToSyslog=yes") ]]; then
	echo -e "CIS $cis4221 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis4221 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		echo "ForwardToSyslog=yes" >> /etc/systemd/journald.conf
		if [[ $(grep -E ^\s*ForwardToSyslog /etc/systemd/journald.conf | grep "ForwardToSyslog=yes") ]]; then
			echo -e "CIS $cis4221 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis4221 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(grep -E ^\s*Compress /etc/systemd/journald.conf | grep "Compress=yes") ]]; then
	echo -e "CIS $cis4222 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis4222 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		echo "Compress=yes" >> /etc/systemd/journald.conf
		if [[ $(grep -E ^\s*Compress /etc/systemd/journald.conf | grep "Compress=yes") ]]; then
			echo -e "CIS $cis4222 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis4222 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(grep -E ^\s*Storage /etc/systemd/journald.conf | grep "Storage=persistent") ]]; then
	echo -e "CIS $cis4223 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis4223 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		echo "Storage=persistent" >> /etc/systemd/journald.conf
		if [[ $(grep -E ^\s*Compress /etc/systemd/journald.conf | grep "Storage=persistent") ]]; then
			echo -e "CIS $cis4223 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis4223 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(find /var/log -type f -perm /g+wx,o+rwx -exec ls -l {} \;) ]]; then
	echo -e "CIS $cis423 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		find /var/log -type f -exec chmod g-wx,o-rwx "{}" + -o -type d -exec chmod g-wx,o-rwx "{}" +
		if [[ $(find /var/log -type f -perm /g+wx,o+rwx -exec ls -l {} \;) ]]; then
			echo -e "CIS $cis423 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis423 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
else
	echo -e "CIS $cis423 \e[32m\e[1mpassed\e[0m"
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $(find /etc/logrotate.conf | grep "logrotate") ]]; then
	echo -e "CIS $cis424 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis424 \e[32m\e[1mpassed\e[0m"
	((cfcis=cfcis+1))
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

z=$((c2cis-cfcis))
per=$(echo "scale=3 ; 100*$z/$c2cis" | bc -l)

echo "Failed Controls $cfcis"
echo "Total Controls $c2cis"
echo "Compliance Percent: $per %"

cfcis=0
cfcis=0

echo -e "###### Check CIS Controls 5.1 Configure time-based job schedulers ######"

crond=$(systemctl is-enabled cron 2>/dev/null)

if [[ $(systemctl is-enabled cron | grep "enabled") ]]; then
	echo -e "CIS $cis511 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis511 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		systemctl --now enable cron
		if [[ $(systemctl is-enabled cron | grep "enabled") ]]; then
			echo -e "CIS $cis511 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis511 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $( stat /etc/crontab | grep 0600 | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
    echo -e "CIS $cis512 \e[32m\e[1mpassed\e[0m"
else
    echo -e "CIS $cis512 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		chown root:root /etc/crontab
		chmod u-x,og-rwx /etc/crontab
		if [[ $( stat /etc/crontab | grep 0600 | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
			echo -e "CIS $cis512 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis512 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $( stat /etc/cron.hourly | grep 0700 | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
    echo -e "CIS $cis513 \e[32m\e[1mpassed\e[0m"
else
    echo -e "CIS $cis513 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		chown root:root /etc/cron.hourly/
		chmod og-rwx /etc/cron.hourly/
		if [[ $( stat /etc/cron.hourly | grep 0700 | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
			echo -e "CIS $cis513 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis513 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $( stat /etc/cron.daily | grep 0700 | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
    echo -e "CIS $cis514 \e[32m\e[1mpassed\e[0m"
else
    echo -e "CIS $cis514 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		chown root:root /etc/cron.daily
		chmod og-rwx /etc/cron.daily
		if [[ $( stat /etc/cron.daily | grep 0700 | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
			echo -e "CIS $cis514 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis514 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $( stat /etc/cron.weekly | grep 0700 | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
    echo -e "CIS $cis515 \e[32m\e[1mpassed\e[0m"
else
    echo -e "CIS $cis515 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		chown root:root /etc/cron.weekly/
		chmod og-rwx /etc/cron.weekly/
		if [[ $( stat /etc/cron.weekly | grep 0700 | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
			echo -e "CIS $cis515 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis515 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $( stat /etc/cron.monthly | grep 0700 | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
    echo -e "CIS $cis516 \e[32m\e[1mpassed\e[0m"
else
    echo -e "CIS $cis516 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		chown root:root /etc/cron.monthly
		chmod og-rwx /etc/cron.monthly
		if [[ $( stat /etc/cron.monthly | grep 0700 | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
			echo -e "CIS $cis516 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis516 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
fi
((c2cis=c2cis+1))
((ccis=ccis+1))

if [[ $( stat /etc/cron.d | grep 0700 | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
    echo -e "CIS $cis517 \e[32m\e[1mpassed\e[0m"
else
    echo -e "CIS $cis517 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		chown root:root /etc/cron.d
		chmod og-rwx /etc/cron.d
		if [[ $( stat /etc/cron.d | grep 0700 | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
			echo -e "CIS $cis517 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis517 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi
fi
((c2cis=c2cis+1))

if [[ -f /etc/cron.deny ]]; then
	echo -e "CIS $cis518 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		rm /etc/cron.deny
		touch /etc/cron.allow
		chown root:root /etc/cron.allow
		chmod u-x,og-rwx /etc/cron.allow
		if [[ $( -f /etc/cron.deny) ]]; then
			echo -e "CIS $cis518 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis518 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi  
else
	if [[ -f /etc/cron.allow ]]; then
		if [[ $( stat /etc/cron.allow | grep 0700 | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
    		echo -e "CIS $cis518 \e[32m\e[1mpassed\e[0m"
		else
			((cfcis=cfcis+1))
			if [[ $1 == "R" ]]; then

				chown root:root /etc/cron.allow
				chmod u-x,og-rwx /etc/cron.allow
				if [[ $( stat /etc/cron.allow | grep 0700 | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
					echo -e "CIS $cis518 remediation \e[32m\e[1msuccesful\e[0m"
				else
					echo -e "CIS $cis518 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
				fi
			fi
		fi
	else
	echo -e "CIS $cis518 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
		if [[ $1 == "R" ]]; then
			touch /etc/cron.allow
			chown root:root /etc/cron.allow
			chmod u-x,og-rwx /etc/cron.allow
			if [[ $( stat /etc/cron.allow | grep 0700 | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
				echo -e "CIS $cis518 remediation \e[32m\e[1msuccesful\e[0m"
			else
				echo -e "CIS $cis518 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
			fi
		fi  
	fi  
fi
((c2cis=c2cis+1))

if [[ -f /etc/at.deny ]]; then
	echo -e "CIS $cis519 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		rm /etc/at.deny
		touch /etc/at.allow
		chown root:root /etc/at.allow
		chmod u-x,og-rwx /etc/at.allow
		if [[ $( -f /etc/at.deny) ]]; then
			echo -e "CIS $cis519 remediation \e[32m\e[1msuccesful\e[0m"
		else
			echo -e "CIS $cis519 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
		fi
	fi  
else
	if [[ -f /etc/at.allow ]]; then
		if [[ $( stat /etc/at.allow | grep 0700 | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
    		echo -e "CIS $cis519 \e[32m\e[1mpassed\e[0m"
		else
			((cfcis=cfcis+1))
			if [[ $1 == "R" ]]; then

				chown root:root /etc/at.allow
				chmod u-x,og-rwx /etc/at.allow
				if [[ $( stat /etc/at.allow | grep 0700 | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
					echo -e "CIS $cis519 remediation \e[32m\e[1msuccesful\e[0m"
				else
					echo -e "CIS $cis519 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
				fi
			fi
		fi
	else
	echo -e "CIS $cis519 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
		if [[ $1 == "R" ]]; then
			touch /etc/at.allow
			chown root:root /etc/at.allow
			chmod u-x,og-rwx /etc/at.allow
			if [[ $( stat /etc/at.allow | grep 0700 | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
				echo -e "CIS $cis519 remediation \e[32m\e[1msuccesful\e[0m"
			else
				echo -e "CIS $cis519 remediation \e[31m\e[1m\e[5mfailed\e[0m.  Check manually"
			fi
		fi  
	fi  
fi
((c2cis=c2cis+1))

echo -e "###### Check CIS Controls 5.2 Configure SSH Server ######"

if [[ $(stat /etc/ssh/sshd_config | grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)" | grep "Access: (0600") ]]; then
    echo -e "CIS $cis521 \e[32m\e[1mpassed\e[0m"
else
    echo -e "CIS $cis521 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		chown root:root /etc/ssh/sshd_config
		chmod og-rwx /etc/ssh/sshd_config
	fi
fi

if [[ $(find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec stat {} \; | grep 0600 |  grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
	echo -e "CIS $cis522 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis522 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec chmod u-x,g-wx,o-rwx {} \;
		find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec chown root:ssh_keys {} \;
	fi
fi

if [[ $(find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec stat {} \; | grep 0644 |  grep "Uid: (    0/    root)" | grep "Gid: (    0/    root)") ]]; then
	echo -e "CIS $cis523 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis523 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
	if [[ $1 == "R" ]]; then
		find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec chmod u-x,go-wx {} \;
		find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec chown root:root {} \;
	fi
fi

if [[ $(sshd -T | grep -E '^\s*(allow|deny)(users|groups)\s+\S+') ]]; then
	echo -e "CIS $cis524 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis524 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
fi

if [[ $(sshd -T | grep loglevel | grep VERBOSE) ]]; then
	echo -e "CIS $cis525 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis525 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
fi

if [[ $(sshd -T | grep maxauthtries | grep -E '1|2|3|4') ]]; then
	echo -e "CIS $cis527 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis527 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
fi

if [[ $(sshd -T | grep ignorerhosts | grep yes) ]]; then
	echo -e "CIS $cis528 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis528 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
fi

if [[ $(sshd -T | grep hostbasedauthentication | grep no) ]]; then
	echo -e "CIS $cis529 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis529 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
fi

if [[ $(sshd -T | grep permitrootlogin | grep no) ]]; then
	echo -e "CIS $cis5210 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis5210 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
fi

if [[ $(sshd -T | grep permitemptypasswords | grep no) ]]; then
	echo -e "CIS $cis5211 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis5211 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
fi

if [[ $(sshd -T | grep permituserenvironment | grep no) ]]; then
	echo -e "CIS $cis5212 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis5212 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
fi

if [[ $(sshd -T | grep ciphers | grep cbc) ]]; then
	echo -e "CIS $cis5213 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
else
	echo -e "CIS $cis5213 \e[32m\e[1mpassed\e[0m"
fi

if [[ $(sshd -T | grep -i "MACs" | grep -E 'md5|sha1|ripemd|64|128|') ]]; then
	echo -e "CIS $cis5214 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
else
	echo -e "CIS $cis5214 \e[32m\e[1mpassed\e[0m"
fi

if [[ $(sshd -T | grep kexalgorithms | grep -E 'diffie-hellman-group1-sha1|diffie-hellman-group14-sha1|diffie-hellman-group-exchange-sha1') ]]; then
	echo -e "CIS $cis5215 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
else
	echo -e "CIS $cis5215 \e[32m\e[1mpassed\e[0m"
fi

if [[ $(sshd -T | grep clientaliveinterval | grep "val 300") ]]; then
	if [[ $(sshd -T | grep clientalivecountmax | grep "max 3") ]]; then
		echo -e "CIS $cis5216 \e[32m\e[1mpassed\e[0m"
	else
		echo -e "CIS $cis5216 \e[31m\e[1m\e[5mfailed\e[0m"
		((cfcis=cfcis+1))
	fi
else
	echo -e "CIS $cis5216 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
fi

if [[ $(sshd -T | grep logingracetime | grep "time 60") ]]; then
	echo -e "CIS $cis5217 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis5217 \e[31m\e[1m\e[5mfailed\e[0m"
	((cfcis=cfcis+1))
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

if [[ $(grep "^Banner" /etc/ssh/sshd_config 2>/dev/null | grep issue) ]]; then
	echo -e "CIS $cis5215 \e[32m\e[1mpassed\e[0m"
else
	echo -e "CIS $cis5215 \e[31m\e[1m\e[5mfailed\e[0m"
fi