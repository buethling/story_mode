class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy

  def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User destroyed."
      redirect_to users_path
  end

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page], :per_page => 25)
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page], :per_page => 5)
    @title = @user.name
  end

  def new
    @user = User.new
    @title = "Sign up"
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      sign_in @user
      flash.now[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
       @title = "Sign up"
       render 'new'
    end
  end

  def edit
    @title = "Edit user"
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
       flash[:success] = "Profile updated."
       redirect_to @user
    else
       @title = "Edit user"
       render 'edit'
    end
  end

  private
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
