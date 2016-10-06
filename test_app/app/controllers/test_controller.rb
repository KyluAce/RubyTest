class TestController < ApplicationController
  layout false
  def index
  	@testowa = "blakablakablaka"

  	@imiona = ["ala", "ola", "mariola"]
  	@id = params[:id].to_i
  end


end
