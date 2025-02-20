class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @video = Video.find(params[:video_id])
    @comment = @video.comments.build(comment_params.merge(user: current_user))

    if @comment.save
      redirect_to @video, notice: "Comment added!"
    else
      redirect_to @video, alert: "Failed to add comment."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
