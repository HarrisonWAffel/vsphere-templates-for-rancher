# This script removes the default cloudbase init unattend configuration file
# and replaces it with a slightly modified version. Notibly, this version changes the
# metadata_services to cloudbaseinit.metadata.services.nocloudservice.NoCloudConfigDriveService

rm "C:\Program Files\Cloudbase Solutions\Cloudbase-Init\conf\cloudbase-init-unattend.conf"

Set-Content -Path "C:\Program Files\Cloudbase Solutions\Cloudbase-Init\conf\cloudbase-init-unattend.conf" -value @"
[DEFAULT]
# What user to create and in which group(s) to be put.
username=Admin
groups=Administrators
inject_user_password=true  # Use password from the metadata (not random).
# Which devices to inspect for a possible configuration drive (metadata).
config_drive_raw_hhd=true
config_drive_cdrom=true
# Path to tar implementation from FreeBSD: https://www.freebsd.org/cgi/man.cgi?tar(1).
bsdtar_path=C:\Program Files (x86)\Cloudbase Solutions\Cloudbase-Init\bin\bsdtar.exe
# Logging debugging level.
verbose=true
debug=true
# Where to store logs.
logdir=C:\Program Files (x86)\Cloudbase Solutions\Cloudbase-Init\log\
logfile=cloudbase-init-unattend.log
default_log_levels=comtypes=INFO,suds=INFO,iso8601=WARN
logging_serial_port_settings=
# Enable MTU and NTP plugins.
mtu_use_dhcp_config=true
ntp_use_dhcp_config=true
# Where are located the user supplied scripts for execution.
local_scripts_path=C:\Program Files (x86)\Cloudbase Solutions\Cloudbase-Init\LocalScripts\
# Services that will be tested for loading until one of them succeeds.
metadata_services=cloudbaseinit.metadata.services.nocloudservice.NoCloudConfigDriveService
# What plugins to execute.
plugins=cloudbaseinit.plugins.common.mtu.MTUPlugin
# Miscellaneous.
allow_reboot=false
stop_service_on_exit=false
"@