function mnt
  if test (count $argv) -eq 0
    echo "Usage: mnt <device> (e.g.: sda1)"
    return 1
  end

  udisksctl mount -b /dev/$argv[1]
end
