param([switch]$Force)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$dest = Join-Path $HOME '.claude\skills'
$cmd = Join-Path $HOME '.claude\commands'
New-Item -ItemType Directory -Force -Path $dest, $cmd | Out-Null
$added = 0; $skipped = @()
Get-ChildItem -Directory (Join-Path $root 'skills') | ForEach-Object {
  $target = Join-Path $dest $_.Name
  if ((Test-Path $target) -and -not $Force) { $skipped += $_.Name; return }
  if (Test-Path $target) { Remove-Item -Recurse -Force $target }
  Copy-Item -Recurse $_.FullName $target
  $added++
}
Get-ChildItem (Join-Path $root 'commands') -File | ForEach-Object {
  $t = Join-Path $cmd $_.Name
  if ((Test-Path $t) -and -not $Force) { $skipped += $_.Name } else { Copy-Item $_.FullName $t -Force }
}
Write-Host "Installed $added skills into $dest"
if ($skipped.Count) { Write-Host ("Skipped (already installed, run with -Force to replace): " + ($skipped -join ', ')) }
Write-Host 'Restart Claude Code, then type / to see them.'
