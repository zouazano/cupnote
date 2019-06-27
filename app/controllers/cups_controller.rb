class CupsController < ApplicationController

  def index
    @q = Cup.ransack(params[:q])
    @cups = @q.result(distinct: true)
    @makers = Maker.order('name ASC').all
    @rank_cups = []
    Cup.all.each do |cup|
      unless cup.user_cups.first.present?
        next
      else
        @rank_cups << cup
      end
    end
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

  private
  def search_params
    params.require(:q).permit(:name_cont)
  end
  
end
