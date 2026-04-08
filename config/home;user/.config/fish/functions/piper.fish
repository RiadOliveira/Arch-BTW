function piper
  pkill openrgb
  uwsm app -- piper
  nohup openrgb --startminimized > /dev/null 2>&1 &
end
