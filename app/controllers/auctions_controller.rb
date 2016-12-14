class AuctionsController < ApplicationController

  def index
  	 @auctions = Auction.order(created_at: :desc)
  end

  def new
  	@auction = Auction.new
  end

	def create
	   auction_params = params.require(:auction)
			.permit([:title,
					 :description,
					 :min_price,
					 :end_date,
					 :start_date
			#		 :id,
			#		 :_destroy
					 ])

        @auction = Auction.new auction_params
	    if @auction.save
   	     redirect_to auction_path(@auction)
	    else
	      render :new
   	    end
	end

  def show
  		@bid = Bid.new
  		@auction = Auction.find params[:id]
  end


end
