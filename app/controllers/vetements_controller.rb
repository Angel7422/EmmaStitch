class VetementsController < ApplicationController
  def index
    @clothing = policy_scope(Clothing)
  end
end
