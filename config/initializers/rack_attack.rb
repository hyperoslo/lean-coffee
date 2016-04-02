class Rack::Attack
  # Throttle all requests by IP (60rpm)
  # Key: "rack::attack:#{Time.now.to_i/:period}:req/ip:#{req.ip}"
  throttle('req/ip', :limit => 300, :period => 5.minutes) do |req|
    req.ip # unless req.path.start_with?('/assets')
  end

  spammers = ENV['spammerList'].split(/,\s*/)

  # Turn spammers array into a regexp
  spammer_regexp = Regexp.union(spammers)
  blacklist("block referer spam") do |request|
    request.referer =~ spammer_regexp
  end
end
