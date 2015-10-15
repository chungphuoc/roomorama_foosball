class HomesController < ApplicationController
  def index
    @users = User.all.sort {|a,b| b.percent_win <=> a.percent_win}
  end
end
