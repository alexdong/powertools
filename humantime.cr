require "option_parser"

banner = "Convert an milli-second epoch into string in local timezone

Usage: 

    humantime 1646112277384
    echo 1646112277384 | humantime
"

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
end

def convert(epoch_ms)
    puts Time.unix_ms(epoch_ms.to_i64).to_local.to_s("%Y-%m-%d %H:%M:%S.%L %z")
end


if ARGV.size > 0
    ARGV.map { |epoch| convert(epoch) }
else
    STDIN.each_line do |epoch|
        convert(epoch) 
    end
end
