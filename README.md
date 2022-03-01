`powertools` is a collection of small, single-purpose, high-performance tools I built using [crystal-lang](https://crystal-lang.org/). To install the tools into `~/bin`, clone the repo then `brew install crystal && ./build.sh`.

```bash
% humantime -h
Convert an milli-second epoch into string in local timezone

Usage:

    humantime 1646112277384
    echo 1646112277384 | humantime
    echo '{"timestamp": 1646112277384, ' | humantime

    -v, --version                    Show version
    -h, --help                       Show help
    
    
% time perl -le 'print scalar localtime 1646112277384' 2>&1
0.01s user 0.01s system 71% cpu 0.021 total

% time humantime 1646112277384 2>&1
0.00s user 0.01s system 88% cpu 0.012 total
```
