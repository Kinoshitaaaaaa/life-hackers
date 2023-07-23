class Public::PostsController < ApplicationController
  def new
    @post=Post.new
    @user=current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
   if params[:create]
    if @post.save(context: :publicize)
      flash[:notice] = "投稿に成功しました！"
      redirect_to post_path(@post.id)
    else
      @posts=Post.all
      render :index
    end

   else
    if @post.update(draft: true)
        redirect_to user_path(current_user), notice: "投稿を下書き保存しました！"
    else
        render :new, alert: "登録できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
    end
   end
  end

  def show
    @post=Post.find(params[:id])
    @user=@post.user
    @comment = Comment.new
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
    # ①下書きの更新（公開）の場合
    if params[:publicize_draft]
      # 公開時にバリデーションを実施
      @post.attributes = post_params.merge(draft: false)
      if @post.save(context: :publicize)
        redirect_to post_path(@post.id), notice: "下書きを公開しました！"
      else
        @post.draft = true
        render :edit, alert: "投稿公開できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # ②公開済みの更新の場合
    elsif params[:update_post]
      @post.attributes = post_params
      if @post.save(context: :publicize)
        redirect_to post_path(@post.id), notice: "投稿を更新しました！"
      else
        render :edit, alert: "投稿を更新できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    # ③下書きの更新（非公開）の場合
    else
      if @post.update(post_params)
        redirect_to post_path(@post.id), notice: "下書きを更新しました！"
      else
        render :edit, alert: "更新できませんでした。お手数ですが、入力内容をご確認のうえ再度お試しください"
      end
    end
  end

 private

  def post_params
   params.require(:post).permit(:title,:body,:genre_id,:image,:draft,:user_id,:name)
  end

end