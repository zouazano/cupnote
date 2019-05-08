class RelationshipsController < ApplicationController
  def create
    user=current_user
    @user=User.find(params[:user_id])
    if user.active_relationships.create(followed_id:@user.id)
      redirect_back(fallback_location: root_path)
      flash = 'フォローしました'
    else
      redirect_to root_url
    end
  end

  def destroy
    user=current_user
    @user=User.find(params[:user_id])
    if user.active_relationships.find_by(followed_id:@user.id).destroy
      redirect_back(fallback_location: root_path)
      flash = 'フォローを解除しました'
    else
      redirect_to root_url
    end
  end
end