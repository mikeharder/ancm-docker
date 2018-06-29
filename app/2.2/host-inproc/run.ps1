using namespace Microsoft.Web.Administration

$name = "ancm-app-2.2-inproc"
$port = 8003
$contentRoot = Join-Path $PSScriptRoot "out"

$sm = Get-IISServerManager
$pools = $sm.ApplicationPools

# Add app pool
$pool = $pools.Add($name)
$pool.StartMode = [StartMode]::AlwaysRunning
$pool.ProcessModel.IdentityType = [ProcessModelIdentityType]::LocalSystem
$pool.ProcessModel.LoadUserProfile = $true
$pool.ManagedRuntimeVersion = ""

# Add site
$site = $sm.Sites.Add($name, $contentRoot, $port)
$site.Applications[0].ApplicationPoolName = $name;

$sm.CommitChanges()

# Wait for user input
Read-Host 'App is running.  Press Enter to stop...' | Out-Null

$sm = Get-IISServerManager

# Stop and remove site
$sites = $sm.Sites
$site = $sites[$name]
$site.Stop()
$sites.Remove($site)

# Stop and remove app pool
$pools = $sm.ApplicationPools
$pool = $pools[$name]
$pool.Stop()
$pools.Remove($pool)

$sm.CommitChanges()
