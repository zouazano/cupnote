class LikesController < ApplicationController
  def create
    user=current_user
    @user_cup=UserCup.find(params[:user_cup_id])
    @like = Like.find_or_create_by(user_id: user.id, user_cup_id:@user_cup.id)
    @like.reload
    respond_to do |format|
      format.js { render 'create', layout: false }
    end
  end

  def destroy
    user=current_user
    @user_cup=UserCup.find(params[:user_cup_id])
    Like.where(user_id: user.id, user_cup_id: @user_cup.id).destroy_all
    respond_to do |format|
      format.js { render 'destroy', layout: false }
    end
  end

  

end
