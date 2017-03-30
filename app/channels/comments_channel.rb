class CommentsChannel < ApplicationCable::Channel
  def self.broadcast(comment)
    broadcast_to comment.post, comment:
      CommentsController.render(partial: 'comments/comment', locals: {comment: comment})
  end

  def subscribed
    stream_from Post.last
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
