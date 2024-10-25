class VetementsController < ApplicationController

  def index
    @clothings = Clothing.all
  end
end
