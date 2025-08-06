function run-emulator
  uwsm app -- nohup $ANDROID_HOME/emulator/emulator -avd $argv[1] > /dev/null 2>&1 & disown
end
