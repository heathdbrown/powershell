# Get all applications from Software Center that are applications
$apps = get-wmiobject -query "SELECT * FROM CCM_Application" -namespace "ROOT\ccm\ClientSDK"

# Get all packages/programs from Software Center
$progs = get-wmiobject -query "SELECT * FROM CCM_Program" -namespace "ROOT\ccm\ClientSDK"

foreach ($app in $apps) {
    if ( $app.InstallState -ne 'Installed' ) {
        Write-Host $app.Fullname
    }
}
