class AccountsController < ApplicationController
  before_action :authenticate_user!

  def switch
    if params[:id] == "0"
      current_user.role = "user"
    else
      @current_organization = Organization.find(params[:id])
      session[:organization_id] = @current_organization.id
      @current_affiliation = Affiliation.find_by(user_id: current_user.id, organization_id: @current_organization.id)
      current_user.role = @current_affiliation.role
    end  
    current_user.save
    
    redirect_to root_path
  end
end
