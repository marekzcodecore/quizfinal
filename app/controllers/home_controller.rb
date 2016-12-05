class HomeController < ApplicationController
	def index
	 @auctions = Auction.order(created_at: :desc)
	end
end
