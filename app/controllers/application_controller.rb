class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  include Pundit

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

end
