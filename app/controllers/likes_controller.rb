class LikesController < ApplicationController
  def create
    user=current_user
    @user_cup=UserCup.find(params[:user_cup_id])
    @like = Like.find_or_create_by(user_id: user.id, user_cup_id:@user_cup.id)
    @like.reload
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end

  def destroy
    user=current_user
    @user_cup=UserCup.find(params[:user_cup_id])
    Like.where(user_id: user.id, user_cup_id: @user_cup.id).destroy_all
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end

  private

  def set_variables
    @user_cup = UserCup.find(params[:user_cup_id])
    @id_name = "#like-link-#{@user_cup.id}"
    @id_like = "#like-#{@user_cup.id}"
  end

end
