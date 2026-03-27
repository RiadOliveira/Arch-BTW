function run-emulator
  set AVD ($ANDROID_HOME/emulator/emulator -list-avds | head -n 1)

  if test -n "$AVD"
    uwsm app -- nohup $ANDROID_HOME/emulator/emulator -avd "$AVD" -gpu host -no-snapshot -no-boot-anim > /dev/null 2>&1 & disown
  else
    echo "No AVD found."
  end
end
