class DashboardController < ApplicationController

  def index
   #@tweets = TwitterRest.search_for('alchemyapi')
   @tweets = TweetAnalyzer.new.analyze('alchemyapi')
  end


end
