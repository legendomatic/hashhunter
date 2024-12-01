# Prerequisite load
Add-Type -AssemblyName System.Windows.Forms

# Prompt SHA256 hash and trim spaces
$targetHash = (Read-Host 'Enter the SHA256 hash to search for').Trim()

# Prompt folder select
$folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
if ($folderBrowser.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    $directory = $folderBrowser.SelectedPath
} else {
    Write-Output "No folder selected. Exiting script."
    exit
}

# Silent operation
$ErrorActionPreference = "SilentlyContinue"

# Initialize progress variables
$totalFiles = (Get-ChildItem -Path $directory -Recurse -File).Count
$currentFile = 0

# Calculate SHA256 hash of a file
function Get-FileHashCustom {
    param (
        [string]$Path
    )
    try {
        $stream = [System.IO.File]::OpenRead($Path)
        $hasher = [System.Security.Cryptography.SHA256]::Create()
        $hashBytes = $hasher.ComputeHash($stream)
        $stream.Close()
        return ([BitConverter]::ToString($hashBytes) -replace "-", "").ToLower()
    } catch {
        # Handle any errors that occur during file reading
        return $null
    }
}

# Process files sequentially
Get-ChildItem -Path $directory -Recurse -File | ForEach-Object {
    $file = $_

    # Calculate the file's hash
    $fileHash = Get-FileHashCustom -Path $file.FullName

    # Compare with the target hash
    if ($fileHash -eq $targetHash) {
        Write-Output "Match found: $($file.FullName)"
    }

    # Update progress bar less frequently for smoother display
    if ($currentFile % 10 -eq 0) {
        Write-Progress -Activity "Searching files" -Status "$currentFile of $totalFiles" -PercentComplete (($currentFile / $totalFiles) * 100)
    }
    $currentFile++
}

Write-Output "Search complete."


