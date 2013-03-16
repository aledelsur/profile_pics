class SiteController < ApplicationController

  def index
    @users = User.paginate(:page => params[:page], :per_page => 80).order(:created_at).reverse_order
  end
  
end
