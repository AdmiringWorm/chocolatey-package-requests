function Compare-Body {
    param (
        [Parameter(Mandatory = $true)]
        [IssueData]$issueData,
        [Parameter(Mandatory = $true)]
        [ValidationData]$validationData,
        [Parameter(Mandatory = $true)]
        [string]$re
    )

    $body = if ($validationData.newBody) {
        $validationData.newBody -join "`n"
    } else {
        $issueData.body -join "`n"
    }

    if ($body -match $re) {
        return $Matches
    }
}
