class FollowRelationshipsController < ApplicationController
  
  before_action :authenticate_user!

    def create
      @user = User.find_by! id: params[:id]
      if current_user.follow @user.id
        flash[:success] = "Vous suivez maintenant le user #{@user.email}"
        respond_to do |format|
          format.html { redirect_to request.referrer }
        end
      end
    end

    def destroy
      @user = User.find_by! id: params[:id]
      if current_user.unfollow @user.id
        flash[:error] = "Vous ne suivez plus le user #{@user.email}"
        respond_to do |format|
          format.html { redirect_to request.referrer }
        end
      end
    end
end