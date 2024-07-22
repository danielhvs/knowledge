https://askubuntu.com/questions/1215009/ubuntu-18-04-cannot-connect-bluetooth-to-android-phone

how to configre bluetooth phones ubuntu using cli

 To configure a Bluetooth phone with Ubuntu using the command line, follow these steps:
1. Check if Bluetooth is enabled:

=systemctl is-active bluetooth=

If it's not active, enable it:

=sudo systemctl start bluetooth=

2. Make sure your Bluetooth phone is in discoverable mode.
3. Scan for available devices:

=bluetoothctl scan on=

4. Once you see your phone's MAC address and name, pair with the device:

=bluetoothctl pair [MAC_ADDRESS]=

Replace =[MAC_ADDRESS]= with your phone's MAC address.

5. After successfully pairing, trust the device if needed:

=bluetoothctl trust [MAC_ADDRESS]=

6. Connect the device:

=bluetoothctl connect [MAC_ADDRESS]=

You can then use your Bluetooth phone normally. You might need to set up your specific application, like a file transfer or audio streaming application, based on your needs.


