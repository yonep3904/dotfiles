# Terminal-Icons
Import-Module Terminal-Icons

# posh-git
Import-Module posh-git

# Oh My Posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/_my_theme.omp.json" | Invoke-Expression

# zoxide
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})

# Clipboard
function _clip {
    $input | Tee-Object -Variable output
    $output | Set-Clipboard
    $output
}
Set-Alias -Name clip -Value _clip
