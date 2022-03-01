require "option_parser"

banner = "Convert an milli-second epoch into string in local timezone

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
"

print_format = "%Y-%m-%d %H:%M:%S.%L %z"

option_parser = OptionParser.parse do |parser|
  parser.banner = banner
  parser.on "-v", "--version", "Show version" do
    puts "version 1.0.0"
    exit
  end
  parser.on "-h", "--help", "Show help" do
    puts parser
    exit
  end
  parser.on "-f FORMAT", "--format=FORMAT", "Specifies the format for the output" do |format|
    print_format = format
  end
end

def convert(epoch_ms, print_format)
    Time.unix_ms(epoch_ms.to_i64).to_local.to_s(print_format)
end

def proc(line, print_format)
    if line.size == 13 && line.to_i64?
        puts convert(line, print_format)
    else
        puts line.gsub(/\d{13}/) { |epoch_ms| convert(epoch_ms, print_format) }
    end
end


if ARGV.size > 0
    ARGV.map { |epoch| proc(epoch, print_format) }
else
    STDIN.each_line do |epoch|
        proc(epoch, print_format) 
    end
end
