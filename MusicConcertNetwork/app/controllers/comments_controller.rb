class CommentsController < ApplicationController
  def create
    @concert = Concert.find_by(id: params[:concert_id])
    @comment = @concert.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment created sucessfully"
    else
      flash.now[:alert] = "ERROR!"
    end
    redirect_to concert_path(@concert)
  end

  private
  def comment_params
    params.require(:comment).permit(:email, :comment)
  end
end
