function mnt-android
  set ANDROID_MNT "/run/media/$USER/Android"

  if not test -d "$ANDROID_MNT"
    sudo mkdir -p "$ANDROID_MNT"
    sudo chown $USER:$USER "$ANDROID_MNT"
  end

  if mtp-detect > /dev/null 2>&1
    echo "1. Connect your Android device via USB"
    echo "2. Select 'File transfer' mode on your device"
    echo "3. Tap 'ALLOW' when the permission prompt appears"

    echo -n "Press ENTER when ready to continue... "
    read -P ""

    if jmtpfs "$ANDROID_MNT"
      echo "Android device mounted at: $ANDROID_MNT"
    else
      echo "Mounting failed."
    end
  end
end
