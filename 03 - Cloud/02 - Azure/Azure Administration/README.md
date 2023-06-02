# Use Azure Resource Manager
https://learn.microsoft.com/en-us/training/modules/use-azure-resource-manager/

Table of Contents
- [Use Azure Resource Manager](#use-azure-resource-manager)
  - [Configure Azure resources with tools](#configure-azure-resources-with-tools)
    - [The Azure portal](#the-azure-portal)
    - [The Azure Cloud Shell](#the-azure-cloud-shell)
    - [Azure PowerShell](#azure-powershell)
    - [Azure CLI](#azure-cli)

## Configure Azure resources with tools

### The Azure portal

https://portal.azure.com

The Azure portal lets you build, manage, and monitor everything from simple web apps to complex cloud applications in a single, unified console.

Features:

- Search resources, services, and docs.
- Manage resources.
- Create customized dashboards and favorites.
- Access the Cloud Shell.
- Receive notifications.
- Links to the Azure documentation.

### The Azure Cloud Shell

Azure Cloud Shell is an interactive, browser-accessible shell for managing Azure resources. It provides the flexibility of choosing the shell experience that best suits the way you work. Linux users can opt for a Bash experience, while Windows users can opt for PowerShell.

Cloud Shell enables access to a browser-based command-line experience built with Azure management tasks in mind. You can use Cloud Shell to work untethered from a local machine in a way only the cloud can provide.

Azure Cloud Shell features

- Is temporary and requires a new or existing Azure Files share to be mounted.
- Offers an integrated graphical text editor based on the open-source Monaco Editor.
- Authenticates automatically for instant access to your resources.
- Runs on a temporary host provided on a per-session, per-user basis.
- Times out after 20 minutes without interactive activity.
- Requires a resource group, storage account, and Azure File share.
- Uses the same Azure file share for both Bash and PowerShell.
- Is assigned to one machine per user account.
- Persists $HOME using a 5-GB image held in your file share.
- Permissions are set as a regular Linux user in Bash.

### Azure PowerShell
Azure PowerShell is a module that you add to Windows PowerShell or PowerShell Core to enable you to connect to your Azure subscription and manage resources. Azure PowerShell requires PowerShell to function. PowerShell provides services such as the shell window and command parsing. Azure PowerShell adds the Azure-specific commands.

Interactive Lapb Simulation: https://mslabs.cloudguides.com/guides/AZ-104%20Exam%20Guide%20-%20Microsoft%20Azure%20Administrator%20Exercise%206

### Azure CLI
Azure CLI is a command-line program to connect to Azure and execute administrative commands on Azure resources. It runs on Linux, macOS, and Windows, and allows administrators and developers to execute their commands through a terminal, command-line prompt, or script instead of a web browser.

Azure CLI can be used interactively or through scripts:

    Interactive. First, for Windows operating systems, launch a shell such as cmd.exe, or for Linux or macOS, use Bash. Then issue the command at the shell prompt.
    Scripted. Assemble the Azure CLI commands into a shell script using the script syntax of your chosen shell. Then execute the script.

Commands in the CLI are structured in groups and subgroups. Each group represents a service provided by Azure, and the subgroups divide commands for these services into logical groupings. For example, the storage group contains subgroups including account, blob, share, and queue.

Interactive lab simulation (Azure CLI)
https://mslabs.cloudguides.com/guides/AZ-104%20Exam%20Guide%20-%20Microsoft%20Azure%20Administrator%20Exercise%207