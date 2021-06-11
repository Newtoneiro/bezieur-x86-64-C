add-auto-load-safe-path /home/Arko/.gdbinit

set disassembly-flavor intel

define ps
print/s *(char**)($rbp+$arg0)
end