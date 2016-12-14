class BidsController < ApplicationController

  #def new
  #	@bid = Bid.new
  #end

 def create
    @auction        = Auction.find params[:auction_id]
    bid_params    = params.require(:bid).permit(:amount)
    @bid          = Bid.new bid_params
    @bid.auction = @auction
    if @bid.save
      redirect_to auction_path(@auction), notice: 'bid made!'
    else
      flash.now[:alert] = 'bid not made.'
      render 'auctions/show'
    end
  end

end
