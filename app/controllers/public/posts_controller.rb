class Public::PostsController < ApplicationController
  def new
    @post=Post.new
    @user=current_user
  end

  def create
    @post = Post.new(post_params)
    @post.genre_id =
    @post.user_id = current_user.id
    @user=current_user

    if @post.save
      flash[:notice] = "You have created post successfully."
      redirect_to post_path(@post.id)
    else
      @posts=Post.all
      render :index
    end
  end

  def show
    @post=Post.find(params[:id])
    @user=@post.user

  end

  def edit
    @user=current_user
    @post=Post.find(params[:id])
    if @post.user == current_user
      render "edit"
    else
      redirect_to post_path
    end
  end

  def search
    @posts = Post.page(params[:page]).per(10)
    @word_for_search = Genre.find(params[:word_for_search])
    @search_posts = Post.where(genre: params[:word_for_search])
  end
end


  def index
    @posts=Post.all
    @user=current_user
    @post=Post.new
    @users=User.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def update
    @post = Post.find(params[:id])
    @user = current_user
    if @post.update(post_params)
      flash[:notice] ="You have updated post successfully."
      redirect_to post_path(@post.id)

    else
      render :edit
    end

  end

  private

  def post_params
    params.require(:post).permit(:title,:body,:genre_id,:profile_imaage)
  end
