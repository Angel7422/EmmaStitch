class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_current_user
  include Pundit::Authorization

  # Pundit: allow-list approach
  after_action :verify_authorized, except: [:index, :index_vetements, :index_sous_vetements, :index_accessoires], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  private

  def set_current_user
    @user = current_user
  end
end
