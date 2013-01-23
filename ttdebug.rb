require 'ruby-debug'
Debugger.start 
trap "INT" do 
  puts caller*"\n\t" 
  debugger 
end
puts "Good to go...\n\n" 