class Auction < ApplicationRecord
  include AASM

  aasm do
  end
 include AASM

  aasm do
  end

  belongs_to :user
  has_many :bids, dependent: :destroy

	validates :title, presence: true, uniqueness: true
	# validates :min_price, numericality: { greater_than_or_equal_to: 1 },
  	#												 allow_destroy: true

  include AASM
  aasm whiny_transitions: false do
    state :draft, initial: true
    state :published
    state :canceled
    state :openbid
    state :closebid

		event :publish do
			transitions from: :draft, to: :published
		end

		event :striketime do
			transitions from: :published, to: :openbid
		end

		event :closetime do
			transitions from: :published, to: :closebid
		end

		event :cancel do
			transitions from: [:draft, :published, :openbid], to: :canceled
		end

		event :relaunch do
			transitions from: :canceled, to: :draft
		end	
	end

	def titleized_title
	   title.titleize
	end


end
