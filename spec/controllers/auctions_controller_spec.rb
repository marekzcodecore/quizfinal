require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do
    describe '#new' do
     context 'no context' do
    
      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
      end

      it 'instantiates a new auction' do
        get :new
        expect(assigns(:auction)).to be_a_new(Auction)
      end
     end
    end

    describe '#create' do
     context 'with valid params' do
      def valid_request
        post :create, params: { auction: attributes_for(:auction) }
      end
      it 'saves a record to the database' do
        count_before = Auction.count
        valid_request
        count_after = Auction.count
        expect(count_after).to eq(count_before + 1)
      end

      it 'redirects to the auction show page' do
        valid_request
        expect(response).to redirect_to(auction_path(Auction.last))
      end
    end 
end
end