class RelationshipsController < ApplicationController
  before_action :signed_in_user
  def create
  	@user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    redirect_to @user
  end

  def destroy
  	@user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    redirect_to @user
  end

  private
  	def signed_in_user
  		unless signed_in?
        store_location
        flash[:notice] = "Please sign in."
        redirect_to signin_url
      end
  	end
end
