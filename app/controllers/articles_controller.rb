class ArticlesController < ApplicationController

  before_action -> {rodauth.require_authentication}

	# GET /articles
  def index
 
  end

end
