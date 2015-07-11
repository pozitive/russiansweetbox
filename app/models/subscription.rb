class Subscription < ActiveRecord::Base
  belongs_to :user

  validates :first_name, :last_name, :street_address,
            :city , :country, presence: true

  attr_accessor :stripe_card_token

end
