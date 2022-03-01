`powertools` is a collection of small, single-purpose tools I built using [crystal-lang](https://crystal-lang.org/). To install the tools into `~/bin`, clone the repo then do `brew install crystal && ./build.sh`.

### humantime
`humantime` turns an epoch ms time into local timezone string. 

```bash
# Manually look up a time
humantime 1646112277384

# Or, be part of the pipe for log analysis
echo 1646112277384 | humantime"
tail -F ... | cut -f 3 | humantime
```
