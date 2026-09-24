# EndOfDay.ps1

Add-Type -AssemblyName PresentationFramework

while ($true) {
    $result = [System.Windows.MessageBox]::Show(
        "This computer is scheduled to shut down.
        `n`nClick Yes to shut down now, or No to continue using the computer for 5 more minutes.",
        "End of Day",
        [System.Windows.MessageBoxButton]::YesNo,
        [System.Windows.MessageBoxImage]::Warning
    )

    # shut down after a minute if user does not interact w/ window
    if ($result -eq [System.Windows.MessageBoxResult]::Yes) {
        shutdown.exe /s /t 60 /c "Computer shutting down in 1 minute."
        break
    }

    # User clicked No or closed the window
    Start-Sleep -Seconds 300
}
