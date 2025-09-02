if ($PSStyle) {
  $PSStyle.FileInfo.Directory = $PSStyle.FileInfo.Executable = $PSStyle.FileInfo.SymbolicLink  = "" 
  $PSStyle.FileInfo.Extension.Clear()
  $PSStyle.Formatting.TableHeader = ""
  $PSStyle.Formatting.FormatAccent = ""
}

oh-my-posh --init --shell pwsh --config ~/.oh-my-posh/config.omp.json | Invoke-Expression