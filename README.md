# splunk.migration
Migrate standalone Splunk using Ansible

1. Preparing to Move the Splunk Instance:
Before moving the Splunk instance to another virtual machine, several considerations and preparations are required:

- Backup Data: Ensure that you have a backup of the Splunk configuration and data.
- Inventory: Maintain an inventory of all required configurations, inputs, and saved searches.
- Network Configuration: Ensure that network settings (TCP/UDP ports, firewall rules) are documented.
- License: Verify that you have the appropriate Splunk license for the new virtual machine.
- Dependencies: Ensure that the necessary dependencies are installed on the new machine.

Talking about the specific systemctl services:

- If the logs are ingested by Splunk, we might check them and understand what they are.
- If this is not the case, then we need to allocate resources (people, time) to investigate this further.
To search existing documentation for the links and interconnections, involve an IT architect in this investigation (if present).
If these services affect Splunk itself, it is not advisable to proceed without understanding.
(I don't think that some other complex prod app is running on the same VM as Splunk does. If that is the case, then there is room for improvement.)

In general, transferring a running Splunk instance to another VM may require additional considerations and downtime.
We may need to synchronize data and update network settings.
This process should be planned carefully to minimize downtime and data loss.

2. Tasks that I consider to be outside of the Scope:

- Initial VM preparation (responsibility of the System team)
- Firewall and Network configuration (Network or Security team)
- Splunk Performance tuning
- Backup policies and procedures (should already be in place, including in Disaster recovery planning)
- Configuration management process. It is outside the scope, but is good have it.

3. Tasks that I consider necessary or desirable:

- Ubuntu VM tuning.
    - To disable swapping
    - To update limits.conf (Splunk, like ELK, works with a huge amount of small files);
- Integrate the Ansible role into a CI/CD pipeline for automated testing and deployment

Documentation regarding the role is in the role folder.

