class DashboardController < ApplicationController

  def index
   @tweets = TwitterRest.search_for('alchemyapi')
  end


end
