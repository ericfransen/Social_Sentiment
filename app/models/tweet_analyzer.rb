require 'rest'

class TweetAnalyzer

  def analyze(search_term)
    collection = get_tweets(search_term)

    tweet_sentiments = collection.map do |tweet|
      get_sentiment(tweet[:text], search_term)
    end

  end

  def get_tweets(search_term)
    TwitterRest.new.search_for(search_term)
  end

  def get_sentiment(tweet_text, search_term)
    alchemyapi_url = "http://access.alchemyapi.com/calls/text/TextGetTargetedSentiment"

    alchemyapi_params = {
      apikey:         ENV['alchemy_key'],
      text:           tweet_text,
      target:         "#{ search_term }",
      outputMode:     "json",
      showSourceText: "1"
    }

    analyzed_tweet = HTTParty.post(alchemyapi_url,
      {
        :body => alchemyapi_params,
        #:basic_auth => { :username => api_key },
        :headers => { 
          'Content-Type' => 'application/x-www-form-urlencoded',
          'Accept' => 'application/json'
        }
      })
    byebug
  end

end



