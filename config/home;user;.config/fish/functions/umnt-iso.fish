function umnt-iso
  udisksctl unmount -b /dev/loop0
  udisksctl loop-delete -b /dev/loop0
end
