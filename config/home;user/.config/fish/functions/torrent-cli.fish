function torrent-cli
  set TEMP (mktemp)
  printf '#!/bin/bash\nkillall transmission-cli 2>/dev/null\nrm -- "$0"\n' > $TEMP

  chmod +x $TEMP
  transmission-cli -D -f $TEMP -w ~/Downloads $argv
end
