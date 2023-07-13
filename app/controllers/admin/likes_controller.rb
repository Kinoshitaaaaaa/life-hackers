class Admin::LikesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    like = user.likes.new(post_id: post.id)
    like.save
    redirect_to admin_post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    like = user.likes.find_by(post_id: post.id)
    like.destroy
    redirect_to admin_post_path(post)
  end
end


