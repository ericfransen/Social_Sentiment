class TwitterRest

  def initialize
    @max_fetched = 100 #max is 100
  end

  #term since:2015-07-19 => containing “term” and sent since date “2015-07-19” (year-month-day).
  #-term => minus omits results with term
  #term ? => contains "term" and is asking a question
  #-rt => removes retweets

  def search_for(search_term)
    TWITTER_REST.search("#{ search_term } -rt", result_type: "recent")
      .take(@max_fetched)
      .reject { |tweet| tweet.user.screen_name == "#{ search_term }" }
      .map do |tweet|
        {
          text: tweet.text,
          id: tweet.id,
          location: tweet.user.location,
          created_at: tweet.created_at,
          screen_name: tweet.user.screen_name,
          followers_count: tweet.user.followers_count,
          retweet_count: tweet.retweet_count,
          favorite_count: tweet.favorite_count
        }
    end
  end
end

