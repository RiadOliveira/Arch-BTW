function purge
  command rm -rf $argv
end

complete -c purge -w rm
