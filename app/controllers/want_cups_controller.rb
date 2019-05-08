class WantCupsController < ApplicationController
  def create
    user=current_user
    @cup=Cup.find(params[:cup_id])
    if WantCup.find_or_create_by(user_id: user.id, cup_id:@cup.id)
      redirect_to cup_path(@cup)
      flash[:note] = '食べたい！に追加しました'
    else
      redirect_to root_url
    end
  end

  def destroy
    user=current_user
    @cup=Cup.find(params[:cup_id])
    if WantCup.where(user_id: user.id, cup_id: @cup.id).destroy_all
      redirect_to cup_path(@cup)
      flash[:note] = '食べたい！から削除しました'
    else
      redirect_to root_url
    end
  end
end