function clip
  if test (count $argv) -eq 0
    echo "Usage: clip file1 [file2 ...]"
    return 1
  end

  set -l uris
  for file in $argv
    set -l fullpath (realpath $file)
    set -a uris "file://$fullpath"
  end

  printf '%s\n' $uris | wl-copy --type text/uri-list

  echo "Copied to clipboard:"
  for uri in $uris
    echo "  $uri"
  end
end
