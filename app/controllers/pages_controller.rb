class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    # authorize @page
    @user = current_user
    authorize(:page, :profile?)

  end

end
