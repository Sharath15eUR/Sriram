```
Question-6:
-----------
Understand how to access a remote system using VNC Viewer, AnyDesk, TeamViewer, and remote desktop connections.

1. VNC Viewer

    -> On the Remote System (Host):
    1. Install VNC Server (e.g., RealVNC, TightVNC).
    2. Set a password during installation.
    3. Note the IP address (`ipconfig` on Windows or `ifconfig` on Linux/Mac).
    4. Allow VNC through the firewall (port 5900).

    -> On the Local System (Client):
    1. Install VNC Viewer.
    2. Open VNC Viewer and enter the remote IP address (e.g., `192.168.1.100:5900`).
    3. Enter the password.
    4. Control the remote system.

2. AnyDesk

    -> On the Remote System (Host):
    1. Download and install AnyDesk.
    2. Set up unattended access (optional): Go to `Settings > Security` and set a password.
    3. Note the AnyDesk address (e.g., `123 456 789`).

    -> On the Local System (Client):
    1. Install AnyDesk.
    2. Open AnyDesk and enter the remote system's AnyDesk address.
    3. Authenticate with the password.
    4. Control the remote system.


3. TeamViewer

    -> On the Remote System (Host):
    1. Download and install TeamViewer.
    2. Set up unattended access (optional): Set a password during installation.
    3. Note the TeamViewer ID (e.g., `123 456 789`) and password.

    -> On the Local System (Client):
    1. Install TeamViewer.
    2. Open TeamViewer and enter the remote system's TeamViewer ID.
    3. Authenticate with the password.
    4. Control the remote system.


4. Remote Desktop Connections (RDP)

    -> On the Remote System (Host):
    1. Enable Remote Desktop: Go to `Settings > System > Remote Desktop` and toggle it on.
    2. Note the IP address or hostname (`ipconfig` in Command Prompt).
    3. Allow RDP through the firewall (port 3389).
    4. Ensure the user account has remote access permissions.

    -> On the Local System (Client):
    1. Open Remote Desktop Connection (search for it on Windows).
    2. Enter the remote system's IP address or hostname.
    3. Authenticate with the username and password.
    4. Control the remote system.


Comparison of Tools:

| Feature                | VNC Viewer          | AnyDesk             | TeamViewer          | RDP                 |
|------------------------|---------------------|---------------------|---------------------|---------------------|
| Platform Support       | Cross-platform      | Cross-platform      | Cross-platform      | Windows-only        |
| Ease of Use            | Moderate            | Easy                | Easy                | Moderate            |
| Speed                  | Moderate            | Fast                | Fast                | Fast                |
| Security               | Password-based      | TLS 1.2             | AES 256-bit         | NLA      |
| Unattended Access      | Possible            | Yes                 | Yes                 | Yes                 |
| Cost                   | Free/Paid versions  | Free/Paid versions  | Free/Paid versions  | Built into Windows  |


```