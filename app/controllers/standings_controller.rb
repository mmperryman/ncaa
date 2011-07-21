class StandingsController < ApplicationController


  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @standings }
    end
  end

end
