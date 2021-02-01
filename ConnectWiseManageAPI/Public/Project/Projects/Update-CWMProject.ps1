﻿function Update-CWMProject {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '', Justification = 'Used by sub-function')]
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [Parameter(Mandatory=$true)]
        [int]$ProjectID,
        [Parameter(Mandatory=$true)]
        [validateset('add','replace','remove')]
        [string]$Operation,
        [Parameter(Mandatory=$true)]
        [string]$Path,
        [Parameter(Mandatory=$true)]
        $Value
    )
    $URI = "https://$($script:CWMServerConnection.Server)/v4_6_release/apis/3.0/project/projects/$ProjectID"
    return Invoke-CWMPatchMaster -Arguments $PsBoundParameters -URI $URI
}
