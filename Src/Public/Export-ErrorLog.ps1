Function Export-ErrorLog
{
    [CmdletBinding()]
    Param ()

    If ($OptimizeErrors.Count -gt 0)
    {
        $Index = 0
        ($OptimizeErrors | ForEach-Object -Process {
                [PSCustomObject]@{
                    Index     = $Index
                    Exception = $PSItem.Exception.Message
                    Category  = $PSItem.CategoryInfo.ToString()
                    ErrorID   = $PSItem.FullyQualifiedErrorId
                    Target    = $PSItem.TargetObject
                    Command   = $PSItem.InvocationInfo.Line.Trim()
                    Script    = $PSItem.InvocationInfo.ScriptName
                    Line      = $PSItem.InvocationInfo.ScriptLineNumber
                    Column    = $PSItem.InvocationInfo.OffsetInLine
                }
                $Index++
            } | Out-String).Trim() | Out-File -FilePath $ErrorLog -Encoding UTF8 -Force -ErrorAction:$ErrorActionPreference
    }
}