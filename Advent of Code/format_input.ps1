gcb | Get-Batches -BatchSize 100 | % { $_ | Join-String -Separator ',' -FormatString "('{0}')" -OutputPrefix 'INSERT INTO #rawdata (Val) VALUES ' -OutputSuffix ';' } | scb
