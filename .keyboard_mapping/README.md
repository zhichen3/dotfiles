This is an instruction for mapping keyboard keys using udev.

The complete tutorial can be found in:

1) https://yulistic.gitlab.io/2017/12/linux-keymapping-with-udev-hwdb/
2) https://wiki.archlinux.org/title/Map_scancodes_to_keycodes

Crucial steps are the following:

1) Find the usb device using `cat /proc/bus/input/devices`.
   Pay attention to which `eventX` is the keyboard.
   Then take note of the first line, where the example is like:
   `Bus=0003 Vendor=0853 Product=0100 Version=0111`

2) Now create the configuration name with a suffix of `.hwdb`.
   Then place that file in `/etc/udev/hwdb.d/`.

3) For the configuration file:
   First, we tell it what input device to map by:

   `evdev:input:b<bus_id>v<vendor_id>p<product_id>e<version_id>-<modalias>`

    using the information from step 1.
    We can simply a glob for `<modalias>`, i.e. `*`.

    Note: use capitalized letters if letters are contained in ID

4) Under it, we can list our keyboard mapping via:

  `KEYBOARD_KEY_<scan_code>=<key_code>`

   Here we map `<scan_code>` to `<key_code>`.

5)  To obtain `<scan_code>` and `<key_code>`, we use:

    `sudo evtest /dev/input/eventX`

    where `X` is the number corresponding to the input device
    found in step 1.

   `<scan_code>` is the value after `(MSC_SCAN), value` in `evtest`.

   `<key_code>` is the lower case of the namestring, which can
    be found in the second line of in `evtest`.

6) After done, run the following lines to update:

  `sudo systemd-hwdb update`
  `sudo udevadm trigger`