class LikesController < ApplicationController
  def create
    user=current_user
    @user_cup=UserCup.find(params[:user_cup_id])
    if Like.find_or_create_by(user_id: user.id, user_cup_id:@user_cup.id)
      redirect_to timelines_index_path
    else
      redirect_to root_url
    end
  end

  def destroy
    user=current_user
    @user_cup=UserCup.find(params[:user_cup_id])
    if Like.where(user_id: user.id, user_cup_id: @user_cup.id).destroy_all
      redirect_to timelines_index_path
    else
      redirect_to root_url
    end
  end
end
