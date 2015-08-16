TWITTER_STREAM = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV['twitter_key']
  config.consumer_secret     = ENV['twitter_secret']
  config.access_token        = ENV['twitter_access_token']
  config.access_token_secret = ENV['twitter_token_secret']
end

TWITTER_REST = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['twitter_key']
  config.consumer_secret     = ENV['twitter_secret']
end

