function app
  set app_command (string escape -- $argv | string join ' ')
  setsid uwsm app -- fish -c "$app_command" > /dev/null 2>&1 &
  disown
end
