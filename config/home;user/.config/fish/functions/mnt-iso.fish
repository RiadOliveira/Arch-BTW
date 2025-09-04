function mnt-iso
  if test (count $argv) -eq 0
    echo "Usage: mnt-iso <iso-file>"
    return 1
  end

  udisksctl loop-setup -f $argv[1]
  udisksctl mount -b /dev/loop0
end
