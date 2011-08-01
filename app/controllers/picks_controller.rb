class PicksController < ApplicationController
  def index
    if !current_user
      redirect_to root_path, :error  => "Gotta be logged in!"
    else  
      @picks = current_user.picks#(:include => :team)
    end  
  end
  
  def create
    current_period = Period.find_by_year('2011')
    if params[:_destroy] == 'true'
      @pick = Pick.where('user_id = ? and team_id = ? and period_id = ?', current_user.id, params[:team_id], current_period.id)
      @pick.destroy_all
    else  
      @pick = Pick.create(:user_id => current_user.id, :period_id => current_period.id, :team_id => params[:team_id])
    end  
    @picks = current_user.picks
    respond_to do |format|
      format.js
    end
  end
  
  def update_picks
    @picks = current_user.picks
    respond_to do |format|
      format.js
    end
  end

end
