require "http/client"
require "digest/md5"

response = HTTP::Client.get "https://www.repfitness.com/strength-equipment/strength-training/rep-ab-5000"
hash = Digest::MD5.hexdigest(response.body)

loop do
  print "Checking.... "
  response = HTTP::Client.get "https://www.repfitness.com/strength-equipment/strength-training/rep-ab-5000"
  temp = Digest::MD5.hexdigest(response.body)
  if temp != hash
    `osascript -e 'display notification "Check the REP Site for Bench"'`
    puts "Different!"
    break
  else
    hash = temp
  end
  puts "Sleeping for 90 Seconds"
  sleep(90)
end


