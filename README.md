# PingCastlePowerBIConnector
PowerBI Connector for PingCastle Enterprise

# How to use it
## Installation

1. Copy the extension file into the `[Documents]\Power BI Desktop\Custom Connectors` directory
![folder](/pictures/folder.png?raw=true "folder")

Note: if this directory doesn't exist, you have to create it

2. Open Power BI Desktop

Note, to load extensions without allowlisting the extension, you will need to lower the security level for extensions in Power BI Desktop to enable loading unsigned/uncertified connectors.
See below.

3. Go to File | Options and settings | Options

![optionsandsettings](/pictures/optionsandsettings.png?raw=true "optionsandsettings")

4. Go the Security tab
5. Under *Data Extensions*, select *Allow any extension to load without warning or validation*

![enablecustomextensions](/pictures/enablecustomextensions.png?raw=true "enablecustomextensions")

6. Restart Power BI Desktop

## How to connect
1. Select Get Data

![main](/pictures/main.png?raw=true "main")

2. Select Source

Enter here the PingCastle Enterprise server FQDN

![setupsource](/pictures/setupsource.png?raw=true "setupsource")

3. From PingCastle Enterprise, select an API key which has the right to read data (upload reports is not ok)

![agentkey](/pictures/agentkey.png?raw=true "agentkey")

4. Copy paste the API key into the PowerBI screen

![insertkey](/pictures/insertkey.png?raw=true "insertkey")

5. You will then be able to see the PingCastle Enterprise data

![navigator](/pictures/navigator.png?raw=true "navigator")

## Troubleshooting

### Invalid FQDN

If the FQDN is invalid, the connector will fail at the preview phase.

The solution is to connect again with the right FQDN.

![invalidurl](/pictures/invalidurl.png?raw=true "invalidurl")

### Invalid Key

If the key is invalid, the connector will fail at the preview phase.

![invalidkey](/pictures/invalidkey.png?raw=true "invalidkey")

Sometimes, the credential is cached and is not asked again.
The solution is to clear it.

Go to Data source settings.

![clearcredential1](/pictures/clearcredential1.png?raw=true "clearcredential1")

Edit the credential.

![clearcredential2](/pictures/clearcredential2.png?raw=true "clearcredential2")

And delete it.

![clearcredential3](/pictures/clearcredential3.png?raw=true "clearcredential3")

# Reference documentation for the plugin
https://learn.microsoft.com/en-us/power-query/
