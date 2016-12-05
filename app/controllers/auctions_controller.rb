class AuctionsController < ApplicationController

  def index
  	 @auctions = Auction.order(created_at: :desc)
  end

  def new
  	@auction = Auction.new
  end

  def create
  		auction_params =(
		params.require(:auction).permit(
		[:title, :description, :price])
		)
	  @auction = Auction.new auction_params
		if @auction.save
			redirect_to auction_path(@auction)
		end

  end


  def show
  end


end
