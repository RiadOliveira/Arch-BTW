function umnt-android
  set android_dir "/run/media/$USER/Android"
  fusermount -u "$android_dir"

  if test -d "$android_dir"
    sudo rmdir "$android_dir"
  end

  echo "Android device unmounted."
end
