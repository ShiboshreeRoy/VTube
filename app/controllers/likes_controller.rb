class LikesController < ApplicationController
  before_action :authenticate_user!  # Ensure user is logged in
  before_action :set_video

  def create
    @video.likes.create(user: current_user)
    redirect_to @video, notice: "You liked this video!"
  end

  def destroy
    like = @video.likes.find_by(user: current_user)
    like.destroy if like
    redirect_to @video, notice: "You unliked this video."
  end

  private

  def set_video
    @video = Video.find(params[:video_id])
  end
end
