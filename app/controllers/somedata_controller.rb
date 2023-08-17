class SomedataController < ApplicationController
  before_action -> {rodauth.require_authentication}

  def index
  end
end
