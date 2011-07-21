class PicksController < ApplicationController
  def index
    if !current_user
      redirect_to root_path, :error  => "Gotta be logged in!"
    else  
      @picks = current_user.picks#(:include => :team)
    end  
  end
end
