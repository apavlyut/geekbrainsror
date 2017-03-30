class CommentsController < ApplicationController
  before_action :set_post

  def create
    @post.comments.create! comments_params
    #CommentsChannel.broadcast(comment)
    redirect_to @post
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:post_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comments_params
    params.require(:comment).permit(:body)
  end

end
