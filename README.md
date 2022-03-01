`powertools` is a collection of small, single-purpose tools I built using [crystal-lang](https://crystal-lang.org/). To install the tools into `~/bin`, clone the repo then `brew install crystal && ./build.sh`.

```bash
% humantime -h
Convert an milli-second epoch into string in local timezone

Usage:

    humantime 1646112277384
    echo 1646112277384 | humantime

    -v, --version                    Show version
    -h, --help                       Show help
```
