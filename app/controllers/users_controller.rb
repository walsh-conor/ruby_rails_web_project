class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]


      def show
        @user = User.find(params[:id])
        @fixtures = @user.fixtures
      end
      def new
        @user = User.new
      end
	 def create
        secure_params = params.require(:user).permit(:name, :email, 
                                  :password, :password_confirmation)
        @user = User.new(secure_params)
        if @user.save
           # Handle a successful save.
		   remember @user 
		    flash[:success] = "Welcome to the Conor's Twitter App!"
		    redirect_to @user
        else
            # Handle an unsuccessful save.
            render 'new'			
        end
      end

    def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
 end