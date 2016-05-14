$client = new-object System.Net.WebClient
$date = Get-Date -format "yyyy-MMdd-HHmm-ss"
$url = "http://192.168.100.1/"
$invocation = (Get-Variable MyInvocation).Value
$path = (Split-Path $invocation.MyCommand.Path) + "/modemData/"

# if page doesn't exist, then it will fail and not create the file
$pages = @(
	#SB6141
	"indexData.htm",
	"cmSignalData.htm",
	"cmLogsData.htm",
	#SB5101U
	"RgStatus.asp",
	"RgSignal.asp",
	"RgEventLog.asp"
)

ForEach ($page In $pages) {
	$client.DownloadFile($url + $page,  $path+$date+$page+'.html')
}
