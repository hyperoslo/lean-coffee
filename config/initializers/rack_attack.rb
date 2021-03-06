class Rack::Attack
  # Throttle all requests by IP (60rpm)
  throttle('req/ip', :limit => 300, :period => 5.minutes) do |req|
    req.ip unless req.path.start_with?('/assets')
  end

  spammers = ENV['spammerList'].split(/,\s*/)

  # Blacklist spammers
  spammer_regexp = Regexp.union(spammers)
  blacklist("block referer spam") do |request|
    request.referer =~ spammer_regexp
  end
end
