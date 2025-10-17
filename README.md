# Battery Threshold Manager

A simple systemd service to manage battery charge thresholds on Linux laptops, helping extend battery lifespan by limiting charge cycles.

This tool sets battery charge start and stop thresholds to prevent your laptop battery from constantly charging to 100%. By keeping the charge between 35% and 85%, you can significantly extend your battery's lifespan.

## Installation

1. Install the files:
   ```bash
   sudo cp battery-threshold.sh /usr/local/bin/
   sudo chmod +x /usr/local/bin/battery-threshold.sh
   sudo cp battery-threshold.service /etc/systemd/system/
   ```

2. Enable and start the service:
   ```bash
   sudo systemctl daemon-reload
   sudo systemctl enable --now battery-threshold.service
   ```

3. Verify the service is running:
   ```bash
   sudo systemctl status battery-threshold.service
   ```

## Usage

The service runs automatically at boot and sets thresholds balancing battery autonomy and lifespan. If you need to charge to 100% before a trip, simply stop the systemd service and charge up.

## Uninstallation

```bash
sudo systemctl disable --now battery-threshold.service
sudo rm /etc/systemd/system/battery-threshold.service
sudo rm /usr/local/bin/battery-threshold.sh
sudo systemctl daemon-reload
```

## Compatibility

This tool uses the `/sys/class/power_supply/BAT0` battery interface.
It works great on modern Thinkpads.

To check if your system supports charge thresholds:
```bash
ls /sys/class/power_supply/BAT0/charge_*_threshold
```

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests.
