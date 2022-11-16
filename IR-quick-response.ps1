Write-Output "Quick IR info..."
Write-Output "Creating output folder"

#Create output catalog
if (Test-Path -Path "output") { } else { mkdir output }

#List all users
Write-Output "Checking user accounts..."
	"Get-LocalUser" >> output\users.txt
	Get-LocalUser >> output\users.txt
	if ($?){ "Users saved to file output\users.txt" }
	else{ "listing users failed." }

#admin accounts
Write-Output "Checking administrator accounts..."
	"net localgroup administrators" >> output\administrators.txt
	net localgroup administrators >> output\administrators.txt
	if ($?){ "users printed successfully.." }
	else{ "printing users failed" }


	"Get-LocalGroupMember Administrators" >> output\administrators.txt
	Get-LocalGroupMember Administrators >> output\administrators.txt
	if ($?){"Administrators saved successfully to output\Administrators"}
	else{ "listing administrators failed." }

#processes 
Write-Output "Checking processes..."
	"wmic process get name,parentprocessid,processid" >> output\tasklist.txt 
	wmic process get name,parentprocessid,processid >> output\tasklist.txt
	if ($?){ "processes printed successfully.." }
	else{ "printing processes failed" }

	"tasklist " >> output\tasklist.txt
	tasklist >> output\tasklist.txt
	if ($?){ "tasklist printed successfully.." }
	else{ "tasklist processes failed" }


	"Get-Process" >> output\tasklist.txt
	Get-Process >> output\tasklist.txt
	if ($?){ "get-process printed successfully.." }
	else{ "get-procces processes failed" }


#services 
Write-Output "Checking services..."
	"Get-Service | Format-Table -AutoSize" >> output\services.txt
	Get-Service | Format-Table -AutoSize >> output\services.txt
	if ($?){ "get-services printed successfully.." }
	else{ "get-services processes failed" }

	"schtasks" >> output\schtasks.txt
	schtasks >> output\schtasks.txt
	if ($?){ "schtasks printed successfully.." }
	else{ "schtasks processes failed" }

	"wmic startup get caption,command" >> output\wmic-startup.txt
	wmic startup get caption,command >> output\wmic-startup.txt
	if ($?){ "wmic startup printed successfully.." }
	else{ "wmic startup processes failed" }

	"Get-ScheduledTask | Format-Table -AutoSize" >> output\get-scheduledtask.txt
	Get-ScheduledTask | Format-Table -AutoSize >> output\get-scheduledtask.txt
	if ($?){ "Get-ScheduledTask printed successfully.." }
	else{ "Get-ScheduledTask processes failed" }

#registry persistence
Write-Output "Checking registry..."
	"reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" >> output\regquery.txt
	reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run >> output\regquery.txt
	if ($?){ "reg query printed successfully.." }
	else{ "reg query processes failed" }

	"reg query HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" >> output\regquery.txt
	reg query HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run >> output\regquery.txt
	if ($?){ "reg query printed successfully.." }
	else{ "reg query processes failed" }


#network connections
Write-Output "Checking network connections files..."
	"netstat -ano" >> output\netstat.txt
	netstat -ano >> output\netstat.txt
	if ($?){ "netstat printed successfully.." }
	else{ "netstat processes failed" }

#event logs
Write-Output "Checking event logs..."
	"Get-EventLog -List" >> output\event-logs.txt
	Get-EventLog -List >> output\event-logs.txt
	if ($?){ "event logs files printed successfully.." }
	else{ "event logs printing failed"}

	"Get-EventLog Application -After (Get-Date).AddHours(-2) | Format-Table -AutoSize" >> output\event-logs.txt
	Get-EventLog Application -After (Get-Date).AddHours(-2) | Format-Table -AutoSize >> output\event-logs.txt
	if ($?){ "event logs files printed successfully.." }
	else{ "event logs printing failed"}

	"Get-EventLog System -After (Get-Date).AddHours(-2) | Format-Table -AutoSize" >> output\event-logs.txt
	Get-EventLog System -After (Get-Date).AddHours(-2) | Format-Table -AutoSize >> output\event-logs.txt
	if ($?){ "event logs files printed successfully.." }
	else{ "event logs printing failed"}

#print exe files
Write-Output "Checking for exe files..."
	forfiles /P C:\Users /D -10 /S /M *.exe /C "cmd /c echo @path" 2>$null >> output\exefiles.txt
	if ($?){ "exe files printed successfully.." }
	else{ "exe files processes failed"}


