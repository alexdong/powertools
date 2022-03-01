epoch_ms = ARGV[0] if ARGV.size > 0
epoch_ms = STDIN.gets_to_end if ARGV.size == 0

case epoch_ms
when Nil
    puts "Convert an milli-second epoch into string in local timezone

    Usage: 

        humantime 1646112277384
        echo 1646112277384 | humantime"
else
    puts Time.unix_ms(epoch_ms.to_i64).to_local.to_s("%Y-%m-%d %H:%M:%S.%L %z")
end
