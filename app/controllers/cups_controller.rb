class CupsController < ApplicationController
  def index
  	
  end
  def show
  	@cup = Cup.find(params[:id])
    if user_signed_in?
      @related_user_cups = []
      @cup.user_cups&.where(user_id:current_user.id).each do |hoga|
        @related_user_cups << hoga
      end
      current_user.following&.each do |hoge|
        @cup.user_cups&.where(user_id:hoge.id).each do |hoga|
          @related_user_cups << hoga
        end
      end
      @unrelated_user_cups = @cup.user_cups - @related_user_cups
    end
  end
end
