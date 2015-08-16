class TwitterRest

  @max_fetched = 100 #max is 100

  #term since:2015-07-19 => containing “term” and sent since date “2015-07-19” (year-month-day).
  #-term => minus omits results with term
  #term ? => contains "term" and is asking a question
  #-rt => removes retweets

  def self.search_for(search_term)
    TWITTER_REST.search("#{ search_term } -rt", result_type: "recent").take(@max_fetched).collect do |tweet|

      #reject if tweet.user.name == "@#{ search_term }" (don't want to analyze tweets from self)

      #puts "#{tweet.user.screen_name}: #{tweet.text}"
      #puts "user_location: #{tweet.user.location}"
      #puts "followers: #{tweet.user.followers_count}"
      #puts "retweet count: #{tweet.retweet_count}"
      #puts "fav count: #{tweet.favorite_count}"

      tweet.text
    end
  end
end
