#!/bin/bash

rsync -aAXS --delete --info=progress2 /home/ares/Archive /mnt/backup
rsync -aAXS --delete --info=progress2 /home/ares/.config /mnt/backup
rsync -aAXS --delete --info=progress2 /home/ares/documents /mnt/backup
rsync -aAXS --delete --info=progress2 /home/ares/music /mnt/backup
rsync -aAXS --delete --info=progress2 /home/ares/pictures /mnt/backup
rsync -aAXS --delete --info=progress2 /home/ares/privateProjects /mnt/backup
rsync -aAXS --delete --info=progress2 /home/ares/pkglists /mnt/backup
rsync -aAXS --delete --info=progress2 /home/ares/.mail /mnt/backup
rsync -aAXS --delete --info=progress2 /home/ares/Nextcloud /mnt/backup
rsync -aAXS --delete --info=progress2 /home/ares/templates /mnt/backup
rsync -aAXS --delete --info=progress2 /home/ares/videos /mnt/backup
rsync -aAXS --delete --info=progress2 /home/ares/.ssh /mnt/backup
rsync -aAXS --delete --info=progress2 /home/ares/.vpn /mnt/backup
