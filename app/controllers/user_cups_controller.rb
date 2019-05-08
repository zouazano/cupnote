class UserCupsController < ApplicationController
  def new
    @user=current_user
    @cup=Cup.find(params[:cup_id])
    @user_cup = @user.user_cups.build
  end

  def create
    @user=current_user
    @cup=Cup.find(params[:cup_id])
    @user_cup = @user.user_cups.build(user_cup_params)
    if UserCup.where(user_id: @user.id, cup_id:@cup.id).create(user_cup_params)
      redirect_to cup_path(@cup)
      flash = '食べた！に登録しました'
    else
      redirect_to root_url
    end
  end

  def destroy
    user=current_user
    @cup=Cup.find(params[:cup_id])
    if UserCup.where(user_id: user.id, cup_id: @cup.id).destroy_all
      redirect_to cup_path(@cup)
      flash = '食べた！から削除しました'
    else
      redirect_to root_url
    end
  end

  private

  def user_cup_params
    params[:user_cup].permit(:value, :review)
  end
end
