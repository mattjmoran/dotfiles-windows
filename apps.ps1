# list of apps to install and their override arguments (if any)
$install = @(
	# Drivers (Device Specific)
	@{id = 'Nvidia.GeForceExperience'; name = 'Nvidia GeForce Experience'}
	@{id = '9P1TBXR6QDCX'; name = 'HyperX NGENUITY'}
	# Browsers
	@{id = 'Google.Chrome'; name = 'Google Chrome'}
	@{id = 'Mozilla.Firefox'; name = 'Mozilla Firefox'}
	# Productivity
	@{id = 'Notion.Notion'; name = 'Notion'}
	@{id = 'Bitwarden.Bitwarden'; name = 'Bitwarden'}
	# Media Players
	@{id = 'DuongDieuPhap.ImageGlass'; name = 'ImageGlass'}
	@{id = 'VideoLAN.VLC'; name = 'VLC'}
	@{id = 'Audacity.Audacity'; name = 'Audacity'}
	# Utilities
	@{id = '9NBLGGH516XP'; name = 'EarTrumpet'}
	# Entertainment
	@{id = 'Spotify.Spotify'; name = 'Spotify'}
	# Dev Tools
	@{id = 'Microsoft.VisualStudioCode'; name = 'Visual Studio Code'; override = '/SILENT /mergetasks="!runcode,addcontextmenufiles,addcontextmenufolders"'}
	@{id = 'Git.Git'; name = 'Git'}
	# Communication
	@{id = 'Discord.Discord'; name = 'Discord'}
	# Gaming
	@{id = 'Valve.Steam'; name = 'Steam'}
	@{id = 'EpicGames.EpicGamesLauncher'; name = 'Epic Games Launcher'}
	@{id = 'RiotGames.Valorant.NA'; name = 'Valorant'; force = $true}
	@{id = 'RiotGames.LeagueOfLegends.NA'; name = 'League of Legends'; force = $true}
	@{id = 'Ubisoft.Connect'; name = 'Ubisoft Connect'}
	@{id = 'RuneLite.RuneLite'; name = 'RuneLite'}
	# Digital Media
	@{id = 'XPDLPKWG9SW2WD'; name = 'Adobe Creative Cloud'}
)

# list of apps to uninstall
$uninstall = @(
	@{id = 'Disney.37853FC22B2CE_6rarf9sa4v8jt'; name = 'Disney+'}
	@{id = 'Clipchamp.Clipchamp_yxz26nhyzhsrt'; name = 'Clipchamp'}
	@{id = 'SpotifyAB.SpotifyMusic_zpdnekdrzrea0'; name = 'Spotify'}
	@{id = 'Microsoft.BingNews_8wekyb3d8bbwe'; name = 'Bing News'}
	@{id = 'Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe'; name = 'Solitaire Collection'}
	@{id = 'Microsoft.OneDriveSync_8wekyb3d8bbwe'; name = 'OneDrive'}
	@{id = 'Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe'; name = 'Feedback Hub'}
	@{id = 'Microsoft.WindowsMaps_8wekyb3d8bbwe'; name = 'Maps'}
	@{id = 'Microsoft.YourPhone_8wekyb3d8bbwe'; name = 'Your Phone'}
	@{id = 'Microsoft.ZuneVideo_8wekyb3d8bbwe'; name = 'Zune Video'}
	@{id = 'microsoft.windowscommunicationsapps_8wekyb3d8bbwe'; name = 'Messaging'}
	@{id = 'Microsoft.Todos_8wekyb3d8bbwe'; name = 'To Do'}
	@{id = 'Microsoft.549981C3F5F10_8wekyb3d8bbwe'; name = 'Get Help'}
	@{id = 'Microsoft.WindowsAlarms_8wekyb3d8bbwe'; name = 'Alarms & Clock'}
	@{id = 'MicrosoftCorporationII.QuickAssist_8wekyb3d8bbwe'; name = 'Quick Assist'}
	@{id = 'Microsoft.OneDrive'; name = 'OneDrive'}
	@{id = 'Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe'; name = 'Microsoft Office'}
	@{id = 'MicrosoftTeams_8wekyb3d8bbwe'; name = 'Microsoft Teams'}
	@{id = 'Microsoft.ZuneMusic_8wekyb3d8bbwe'; name = 'Zune Music'}
	@{id = 'Microsoft.GetHelp_8wekyb3d8bbwe'; name = 'Get Help'}
	@{id = 'Microsoft.Getstarted_8wekyb3d8bbwe'; name = 'Microsoft Tips'}
	@{id = 'Microsoft.HEIFImageExtension_8wekyb3d8bbwe'; name = 'HEIF Image Extension'}
	@{id = 'Microsoft.HEVCVideoExtension_8wekyb3d8bbwe'; name = 'HEVC Video Extension'}
	@{id = 'Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe'; name = 'Sticky Notes'}
	@{id = 'Microsoft.Paint_8wekyb3d8bbwe'; name = 'Paint'}
	@{id = 'Microsoft.People_8wekyb3d8bbwe'; name = 'Microsoft People'}
	@{id = 'Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe'; name = 'Power Automate'}
	@{id = 'Microsoft.RawImageExtension_8wekyb3d8bbwe'; name = 'Raw Image Extension'}
	@{id = 'Microsoft.VP9VideoExtensions_8wekyb3d8bbwe'; name = 'VP9 Video Extensions'}
	@{id = 'Microsoft.WebMediaExtensions_8wekyb3d8bbwe'; name = 'Web Media Extensions'}
	@{id = 'Microsoft.WebpImageExtension_8wekyb3d8bbwe'; name = 'WebP Image Extension'}
	@{id = 'Microsoft.WindowsCamera_8wekyb3d8bbwe'; name = 'Camera'}
	@{id = 'Microsoft.WindowsSoundRecorder_8wekyb3d8bbwe'; name = 'Sound Recorder'}
	@{id = 'Microsoft.EdgeWebView2Runtime'; name = 'Microsoft Edge WebView2 Runtime'}
	@{id = 'Microsoft.ScreenSketch_8wekyb3d8bbwe'; name = 'Snipping Tool'}
)

# default flags to use when installing apps
$flags = "--accept-source-agreements --accept-package-agreements"

# clear the console and set the title to the script name
Clear-Host
$host.ui.RawUI.WindowTitle = "Installing/Uninstalling Apps"

# see if the user passed in either the -u or -i flag to uninstall or install apps (optional)
$uninstallFlag = $args.Contains("-u")
$installFlag = $args.Contains("-i")

# if the user didn't pass in either flag, default to uninstalling and installing apps
if (!$uninstallFlag -and !$installFlag) {
	$uninstallFlag = $installFlag = $true
}

# check to see if we are currently not running as admin
if (([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
	Write-Host "This script must NOT be run as administrator. Please run it again with admin privileges."
	Write-Host "Press any key to exit...`n"
	$null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
	exit
}

# check if winget is installed, if not, prompt to install it
if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
	Write-Host "Install WinGet first, then run this script again."
	Write-Host "WinGet: https://apps.microsoft.com/store/detail/app-installer/9NBLGGH4NNS1"
	Write-Host "Press any key to exit..."
	$null = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
	exit
}

# make room for the progress bar
Write-Host "`n`n`n`n`n`n`n`n"

# uninstall each app in the uninstall list
if ($uninstallFlag) {
	$length, $count= $uninstall.Count, 0
	foreach ($app in $uninstall) {
		# show the progress bar and increment the count
		Write-Progress -Activity "Uninstalling Apps..." -Status "$count of $length Apps Uninstalled:" -PercentComplete ([int](($count++ / $length) * 100))
		# see if the app is not installed, if so, skip it
		$process = Start-Process -FilePath "winget" -ArgumentList "list -e --id $($app.id)" -Wait -PassThru -WindowStyle Hidden
		if ($process.ExitCode -ne 0) {
			Write-Host "Skipping $($app.name) because it is not installed." -ForegroundColor yellow -BackgroundColor black
			continue
		}
		# print out the app name being uninstalled
		Write-Host "Uninstalling $($app.name)..." -ForegroundColor red -BackgroundColor black
		# uninstall the app
		$process = Start-Process -FilePath "winget" -ArgumentList "uninstall -e --id $($app.id)" -Wait -PassThru -WindowStyle Hidden
	}
}

# install each app in the install list
if ($installFlag) {
	$length, $count= $install.Count, 0
	foreach ($app in $install) {
		# show the progress bar and increment the count
		Write-Progress -Activity "Installing Apps..." -Status "$count of $length Apps Installed:" -PercentComplete ([int](($count++ / $length) * 100))
		# see if the app is already installed, if so, skip it
		$process = Start-Process -FilePath "winget" -ArgumentList "list -e --id $($app.id)" -Wait -PassThru -WindowStyle Hidden
		if ($process.ExitCode -eq 0) {
			Write-Host "Skipping $($app.name) because it is already installed." -ForegroundColor yellow -BackgroundColor black
			continue
		}
		# print out the app name being installed
		Write-Host "Installing $($app.name)..." -ForegroundColor green -BackgroundColor black
		# see if the app has a force flag, if so, use it with the default parameters
		if ($app.force) {
			$process = Start-Process -FilePath "winget" -ArgumentList "install $flags --force --id $($app.id)" -Wait -PassThru -WindowStyle Hidden
		}
		# see if the app has an override argument, if so, use it with the default parameters
		elseif ($app.override) {
			$process = Start-Process -FilePath "winget" -ArgumentList "install $flags --id $($app.id) --override $($app.override)" -Wait -PassThru -WindowStyle Hidden
		}
		# see if the app has an id value, if so, use it with the default parameters
		elseif ($app.id) {
			$process = Start-Process -FilePath "winget" -ArgumentList "install $flags --id $($app.id)" -Wait -PassThru -WindowStyle Hidden
		}
		# if the app has no id or msstore, skip it
		else {
			Write-Host "Skipping $($app.name) because it has no id." -ForegroundColor yellow -BackgroundColor black
			continue
		}
	}	
}