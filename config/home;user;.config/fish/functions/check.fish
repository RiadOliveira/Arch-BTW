function check
  fd $argv | while read -l item
    test -d $item; and eza $item; or bat $item
  end
end
