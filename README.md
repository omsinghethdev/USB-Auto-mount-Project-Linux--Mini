# DiskPilot
**A "doctor" for your disks - LVM management, partitioning, corruption handallin, data recovery and automount, all in one tool.**
> Status: Active Development.Core structure is in place; module functionality is being uilt incremently.Not yet production ready.

## What is DiskPilot?

DiskPilot is a linux disk management tool build to act like a doctor for your storage - diagnosing, fixing and managing disks the way a real systemadmin would, but through a single guided interface instead of memorizing a dozen seperated commands(`parted`, `lvcreate`, `fsck`, `ddrescue`, `fstab` entries etc.).

## Planed Capabilities

- **Partition Management** - create, format and merge partition tables(GPT/MDOS)
- **LVM Management** - phisical volumes, volume groups, logical volumes, resizing, snapshots
- **Disk Health ("doctor")** - filesystem check(`fsck`) and Smart Health Monitoring
- **Data Recovery** - safe imaging and recovery from failing/corrupted disks (`ddrescue`-based)
- **True automount** - udev + system based automatic mounting , no manual steps


## Architecture

DiskPilot is build as a **Two-Layer System**
1. **Engine Layer** - non-interactive bash functions that do the actual disk work. Each funcition take argument and returns structured JSON, with no interactive prompts. This makes engine availabe from anywhere: a CLI, a future local api server or a future desktop/web GUI.
2, **Interface layer** - currently a CLI (`cli/prompts.sh`) that handle user interaction and confirmations, then calls into  the engine. Planned future interfaces (local API server + desktop/web GUI) will call same enginge without change to it.


## Contributing

This is a currently solo learning project but suggestion and issues are welcome.