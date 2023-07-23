class Admin::PostsController < ApplicationController

  def new
    @post=Post.new
    @user=@post.user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = user.id

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
    @comment = Comment.new
  end

  def edit
    @user=User.find(params[:id])
    @post=Post.find(params[:id])

      render "edit"

  end

  def search
    @posts = Post.page(params[:page]).per(10)
    @word_for_search = Genre.find(params[:word_for_search])
    @search_posts = Post.where(genre: params[:word_for_search])

  end

  def keyword_search
     @range = params[:range]
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @posts = Post.looks(params[:search], params[:word])
    end

    render "search"

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
      params.require(:post).permit(:title,:body,:genre_id,:image)
    end


end
