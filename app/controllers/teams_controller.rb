class TeamsController < ApplicationController
  def index
    @teams = Team.find(:all, :include => :records)
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
    @team.records.build(:period_id => Period.find_by_year('2010'), :wins => 0)
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      redirect_to :teams, :notice => "Successfully created team."
    else
      render :action => 'new'
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(params[:team])
      redirect_to @team, :notice  => "Successfully updated team."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_url, :notice => "Successfully destroyed team."
  end
  
  def win
    @team = Team.find(params[:id])
    record = @team.records.find_by_period_id(Period.find_by_year('2012'))
    record.update_attribute(:wins, record.wins + 1)
    @team = Team.find(params[:id])
    respond_to do |format|
      format.js
    end  
  end
  
  def loss
    @team = Team.find(params[:id])
    record = @team.records.find_by_period_id(Period.find_by_year('2012'))
    record.update_attribute(:wins, record.wins - 1)
    @team = Team.find(params[:id])
    respond_to do |format|
      format.js
    end  
  end
  
end
