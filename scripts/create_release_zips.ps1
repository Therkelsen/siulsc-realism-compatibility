param (
    [string]$mod_version,
    [string]$spt_version
)

# Define the release directory
$releaseDir = ".\release"

# Create release directory if it doesn't exist
if (-Not (Test-Path -Path $releaseDir)) {
    New-Item -ItemType Directory -Path $releaseDir -Force
}

# Create directory names within the release directory
$baseDir = "$releaseDir\ar54-realism-compatibility_v${mod_version}_SPT-v${spt_version}"

# Define the inner directory structure
$innerDir = "user\mods\SPT-Realism\db\put_new_stuff_here\AR-54"

# Create the directories
New-Item -ItemType Directory -Path "$baseDir\$innerDir" -Force

# Move compat file
Copy-Item -Path 'AR-54\AR-54.json' -Destination "$baseDir\$innerDir"

# Create zip files
Compress-Archive -Path "$baseDir\*" -DestinationPath "$releaseDir\ar54-realism-compatibility_v${mod_version}_SPT-v${spt_version}.zip" -Force

# Clean up the created directories
Remove-Item -Recurse -Force "$baseDir"