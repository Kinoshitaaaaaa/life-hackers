class Public::UsersController < ApplicationController

  before_action :set_user, only: [:likes]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post=Post.new

  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] ="You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def edit
     @user=User.find(params[:id])
     @users=@user.posts
    if @user == current_user
       render :edit
    else
       redirect_to user_path(current_user)
    end
  end

  def index
    @user=current_user
    @post=Post.new
    @users=User.all

  end

  def is_deleted
    @user = current_user
   # @user.is_deleted = true
    if @user.update!(is_deleted: true)
      reset_session
      redirect_to root_path
    end
  end

  def unsubscribe
  end

  def likes
    likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Post.find(likes)
  end


  private

  def user_params
    params.require(:user).permit(:user_name, :introduction, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
