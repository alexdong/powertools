`powertools` is a collection of small, single-purpose, high-performance tools I built using [crystal-lang](https://crystal-lang.org/). To install the tools into `~/bin`, clone the repo then `brew install crystal && ./build.sh`.

```bash
% humantime -h
Convert an milli-second epoch into string in local timezone

The timestamp can be provided in three ways:

1) interactively

    humantime

2) as an argument or arguments

    humantime 1646112277384
    echo 1646112277384 | humantime
    echo 'timestamp: 1646112277384' | humantime

3) or through the STDIN and unix pipe as a handy `sed` replacement

    # Replace the epoch with a human reading string
    cat payload.json | humantime
    aws logs filter-log-events | humantime

    # You can also use `-f` to extract the time format you are interested in.
    # For example, the following example shows log events per hour
    aws logs tail | cut -f 3 | humantime -f '%d:%H' | sort | uniq -c

    -v, --version                    Show version
    -h, --help                       Show help
    -f FORMAT, --format=FORMAT       Specifies the format for the output
    
    
alexdong@Mac-mini powertools % hyperfine "humantime 1646112277384 > /dev/null"
Benchmark #1: humantime 1646112277384 > /dev/null
  Time (mean ± σ):       4.8 ms ±   0.5 ms    [User: 1.9 ms, System: 2.7 ms]
  Range (min … max):     4.1 ms …   6.6 ms    220 runs

  Warning: Command took less than 5 ms to complete. Results might be inaccurate.

alexdong@Mac-mini powertools % hyperfine "perl -le 'print scalar localtime 1646112277384' > /dev/null"
Benchmark #1: perl -le 'print scalar localtime 1646112277384' > /dev/null
  Time (mean ± σ):      10.0 ms ±   0.6 ms    [User: 3.6 ms, System: 3.5 ms]
  Range (min … max):     8.6 ms …  13.4 ms    147 runs
```
