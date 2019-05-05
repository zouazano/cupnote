class TimelinesController < ApplicationController
	def index
    @hogas = []
    UserCup.all.each do |hoge|
      @hogas << hoge
    end
    WantCup.all.each do |hoge|
      @hogas << hoge
    end
	end

  def friends
    if user_signed_in?
      @hogas = []
      current_user.want_cups&.each do |hoga|
        @hogas << hoga
      end
      current_user.user_cups&.each do |hoga|
        @hogas << hoga
      end
      current_user.following&.each do |hoge|
        hoge.want_cups&.each do |hoga|
          @hogas << hoga
        end
        hoge.user_cups&.each do |hoga|
          @hogas << hoga
        end
      end
    else
      redirect_to :action => "index"
    end

  end
  
end
