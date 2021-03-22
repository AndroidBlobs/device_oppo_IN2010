#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:6dd6e0f94c3697752c14b2f693dd00cf06571785; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:27339828af26936a1b7da5338ad6373da9f94ec3 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:6dd6e0f94c3697752c14b2f693dd00cf06571785 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
