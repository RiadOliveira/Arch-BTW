function umnt
  if test (count $argv) -eq 0
    echo "Usage: umnt <device> (e.g.: sda1)"
    return 1
  end

  udisksctl unmount -b /dev/$argv[1]
end
