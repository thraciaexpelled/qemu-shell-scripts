### <p style="font-size:30px"><code>qemu-shell-scripts</code></p>
*by, clangjesus*

This is a collection of some shell scripts for QEMU. These scripts can be modified, used for
both personal and commercial purposes with or without citing the author.

### Contributing

If you want to add your own shell script, create it, and submit a PR.

> [!IMPORTANT]
> The file structure of the shell script MUST BE AS IT FOLLOWS:
> ```
> -> qemu-shell-scripts
>    -> <os>-<os type (distro name, etc..)-<arch>
>	-> ./run.sh
> ```

> [!IMPORTANT]
> The code structure for `./run.sh` MUST BE AS IT FOLLOWS:
> ```bash
> #!/bin/bash
> 
> set -e
> 
> ISO=$1
> DISK=""
>
> set -e
> 
> ISO=$1
> DISK=""
> 
> [[ -z "$ISO" ]] && echo "ISO not set" >&2 && exit 1
> [[ -f "disk.qcow2" ]] || qemu-img create disk.qcow2 20G -f qcow2 && DISK="disk.qcow2"
> 
> echo "  Using ISO:      '$ISO'"
> echo "  Using DISK:     '$DISK'"
> echo
>
> qemu-system-x86_64 -drive file="$DISK",media=disk,format=qcow2 \
>        -drive file="$ISO",media=cdrom \
>	 # ... insert more arguments as needed ...
> ```

<h1 align="center">clangjesus</h1>
