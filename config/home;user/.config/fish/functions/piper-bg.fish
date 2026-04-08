function piper-bg
  pkill openrgb
  nohup fish -c "uwsm app -- piper; nohup openrgb --startminimized > /dev/null 2>&1 &" > /dev/null 2>&1 &
end
