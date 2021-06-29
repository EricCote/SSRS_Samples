$portal = 'http://localhost/reports/'
$computerName = "localhost" 
$reportServerInstance = "PBIRS" 
$reportServerVersion = "SQLServervNext"


Install-PackageProvider -Name NuGet   -force;
Install-Module -Name ReportingServicesTools -Force;
Install-Module -Name SqlServer -Force;



Connect-RsReportServer -ComputerName $computerName  -ReportServerInstance $reportServerInstance -ReportServerVersion $reportServerVersion


New-RsFolder  -Path "/" -Name "Offline 2019 Samples" -Verbose
Write-RsFolderContent -Path ".\Microsoft\2019\Offline 2019 Samples" `
                      -Destination "/Offline 2019 Samples" -Verbose

New-RsFolder  -Path "/" -Name "Other Reports 2008 R2" -Verbose
Write-RsFolderContent -Path ".\Microsoft\2008R2\Report Builder 3.0 Stand-alone Sample Reports" `
                    -Destination "/Other Reports 2008 R2" -Verbose

New-RsFolder  -Path "/" -Name "Community" -Verbose
Write-RsFolderContent -Path ".\Community" `
                    -Destination "/Community" -Verbose                    


$rsconfig = Get-RsDeploymentConfig -RsProjectFile '.\Microsoft\2008\AdventureWorks 2008 Sample Reports\AdventureWorks 2008 Sample Reports.rptproj' `
                  -ConfigurationToUse Release | Add-Member -PassThru -MemberType NoteProperty -Name ReportPortal -Value $portal

$RSConfig | Publish-RsProject

$rsconfig = Get-RsDeploymentConfig -RsProjectFile '.\Microsoft\2008\Offline 2008 Sample Reports\ChartSamples\ChartSamples.rptproj' `
                  -ConfigurationToUse Release | Add-Member -PassThru -MemberType NoteProperty -Name ReportPortal -Value $portal

$RSConfig | Publish-RsProject

$rsconfig = Get-RsDeploymentConfig -RsProjectFile '.\Microsoft\2008\Offline 2008 Sample Reports\GaugeSamples\GaugeSamples.rptproj' `
-ConfigurationToUse Release | Add-Member -PassThru -MemberType NoteProperty -Name ReportPortal -Value $portal

$RSConfig | Publish-RsProject

$rsconfig = Get-RsDeploymentConfig -RsProjectFile '.\Microsoft\2008\Offline 2008 Sample Reports\TextSamples\TextSamples.rptproj' `
-ConfigurationToUse Release | Add-Member -PassThru -MemberType NoteProperty -Name ReportPortal -Value $portal

$RSConfig | Publish-RsProject


$rsconfig = Get-RsDeploymentConfig -RsProjectFile '.\Microsoft\2008R2\Offline 2008 R2 Sample Reports\ChartSamples 2008 R2\ChartSamplesRS2008R2.rptproj' `
                  -ConfigurationToUse Release | Add-Member -PassThru -MemberType NoteProperty -Name ReportPortal -Value $portal

$RSConfig | Publish-RsProject
                                                   
$rsconfig = Get-RsDeploymentConfig -RsProjectFile '.\Microsoft\2008R2\Offline 2008 R2 Sample Reports\GaugeSamples 2008 R2\GaugeSamplesRS2008R2.rptproj' `
-ConfigurationToUse Release | Add-Member -PassThru -MemberType NoteProperty -Name ReportPortal -Value $portal

$RSConfig | Publish-RsProject

$rsconfig = Get-RsDeploymentConfig -RsProjectFile '.\Microsoft\2008R2\Offline 2008 R2 Sample Reports\TextSamples 2008 R2\TextSamplesRS2008R2.rptproj' `
-ConfigurationToUse Release | Add-Member -PassThru -MemberType NoteProperty -Name ReportPortal -Value $portal

$RSConfig | Publish-RsProject


$rsconfig = Get-RsDeploymentConfig -RsProjectFile '.\Microsoft\2008R2\AdventureWorks 2008 R2 Sample Reports\AdventureWorks 2008R2.rptproj' `
-ConfigurationToUse Release | Add-Member -PassThru -MemberType NoteProperty -Name ReportPortal -Value $portal

$RSConfig | Publish-RsProject

$rsconfig = Get-RsDeploymentConfig -RsProjectFile '.\Microsoft\2012\AdventureWorks 2012 Sample Reports\AdventureWorks 2012 Sample Reports.rptproj' `
-ConfigurationToUse Release | Add-Member -PassThru -MemberType NoteProperty -Name ReportPortal -Value $portal

$RSConfig | Publish-RsProject


