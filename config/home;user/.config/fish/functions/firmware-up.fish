function firmware-up
  fwupdmgr refresh
  echo ""

  echo "=== Available firmware updates ==="
  fwupdmgr get-updates
  echo ""

  read -l -P "Apply updates? (y/N) " answer
  if test "$answer" = "y"
    fwupdmgr update
  else
    echo "Aborted."
  end
end
