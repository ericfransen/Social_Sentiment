class TwitterStream

  #def initialize(external_client=TWITTER_STREAM)
  #  @twitter_stream = external_client
  #end

  def self.stream_tweets_for(search_array=['alchemyapi'])
    TWITTER_STREAM.filter(:track => search_array.join(",")) do |object|
      if object.is_a?(Twitter::Tweet)
        puts "#{object.id} #{object.user.screen_name} - #{object.text}"
        puts "#{object.user.location}"
        puts "#{object.user.friends_count}"

        puts "RT: #{object.retweet_count}"
        puts "Fav: #{object.favorite_count}"
        puts "---------------------------------------------"
      end
    end
  end
end


