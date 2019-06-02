$wshell = New-Object -ComObject wscript.shell;

function writeToScreen {
$newstreamreader = New-Object System.IO.StreamReader("C:\Users\UserName\Desktop\sampleFile.txt")
$eachlinenumber = 1
while (($readeachline =$newstreamreader.ReadLine()) -ne $null)
{
        foreach ($char in $readeachline.ToCharArray()){
            write-host $char
            if ($char -eq ','){
                Start-Sleep -Milliseconds 300
                $wshell.SendKeys(",")
            }elseif ($char -eq '.'){
                Start-Sleep -Milliseconds 300
                $wshell.SendKeys(".")

            }elseif ($char -eq '{'){
                Start-Sleep -Milliseconds 300
                $wshell.SendKeys("{{}")
		        $wshell.SendKeys("{TAB}")
            }elseif ($char -eq '}'){
                Start-Sleep -Milliseconds 300
		        $wshell.SendKeys("{RIGHT}")
            }
            
            elseif ($char -eq '('){
                Start-Sleep -Milliseconds 300
                $wshell.SendKeys("{(}")
            }elseif ($char -eq ')'){
                Start-Sleep -Milliseconds 300
                $wshell.SendKeys("{)}")
            }
            
            elseif ($char -eq '}'){
                Start-Sleep -Milliseconds 300
            }elseif ($char -eq ' '){
                $wshell.SendKeys(" ")
            }else{
                $wshell.SendKeys($char)
            }
            Start-Sleep -Milliseconds 50
        }
    $wshell.SendKeys("{ENTER}")
    $eachlinenumber++
    Start-Sleep -Milliseconds 300
}
$wshell.SendKeys("{BACKSPACE}")
$newstreamreader.Dispose()
}


# show the MsgBox:
$result = [System.Windows.Forms.MessageBox]::Show('Do you want to start?', 'Warning', 'YesNo', 'Warning')

# check the result:
if ($result -eq 'Yes')
{
    sleep 3
    writeToScreen
}
else
{
  Write-Warning 'Stopped script'
}


