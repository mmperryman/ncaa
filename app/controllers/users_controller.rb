class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        @user.payments.create(:period_id => Period.find_by_year('2012').id)
        format.html { redirect_to(root_path, :notice => 'Registration Complete.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      debugger
      if @user.update_attributes(params[:user])
        if @user == current_user
          format.html { redirect_to(root_path, :notice => 'User Profile was successfully updated.') }
        elsif current_user.admin?
          format.html { redirect_to(users_path, :notice => 'User Profile was successfully updated.') }
        end    
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_path) }
      format.xml  { head :ok }
    end
  end
  
  # app/controllers/users_controller.rb
  def reset_password
    @user = User.find_using_persistence_token(params[:reset_password_code]) || (raise Exception)
  end

  def reset_password_submit
    @user = User.find_using_persistence_token(params[:reset_password_code]) || (raise Exception)
    # @user.active = true
    if @user.update_attributes(params[:user].merge({:active => true}))
      flash[:notice] = "Successfully reset password."
      redirect_to @user
    else
      flash[:notice] = "There was a problem resetting your password."
      render :action => :reset_password
    end
  end  
end
