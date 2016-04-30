class ConcertsController < ApplicationController
  def index
    @concerts = Concert.all
  end

  def new
    @concert = Concert.new
  end

  def create
    @concert = Concert.new(concert_params)
    if @concert.save
      flash[:notice] = "Concert created sucessfully"
      redirect_to concerts_path
    else
      flash.now[:alert] = "ERROR!"
      render "new"
    end
  end

  def show
    @concert = Concert.find_by(id: params[:id])
    @comments = @concert.comments
    @comment_new = Comment.new
  end

  def most_comments
    @concerts = Concert.mostCommentedConcerts
  end

  private
  def concert_params
    params.require(:concert).permit(:artist, :venue, :city, :date,
      :price, :description)
  end
end
