# hashhunter

PowerShell File Hash Checker
This PowerShell script allows users to search for files with a specific SHA256 hash within a selected directory. It is designed to work on systems running PowerShell versions below 7, without performance tuning optimizations due to limitations in older versions.
Features
User Input for SHA256 Hash: Prompts the user to enter the hash to search for.
Directory Selection: Allows users to browse and select the directory to scan.
Progress Indicator: Displays a progress bar to show the scanning status.
Sequential Processing: Processes files one by one, ensuring compatibility with PowerShell versions below 7.
Usage
Run the Script: Open PowerShell and execute the script.
Enter SHA256 Hash: When prompted, input the SHA256 hash you want to search for.
Select Directory: Use the folder browser dialog to choose the directory you wish to scan.
View Results: The script will output any matches found and display a progress bar during execution.
Limitations
Performance: This script does not include multithreading or performance optimizations due to compatibility issues with PowerShell versions below 7.
Error Handling: Basic error handling is implemented, but users should ensure they have appropriate permissions for accessing files in the selected directory.
Requirements
Windows with PowerShell installed (version below 7).
.NET Framework for Windows Forms usage.
License
Provided as-is with no assurance of non-impact to performance or finance. No code in this script has been designed with malintent.
