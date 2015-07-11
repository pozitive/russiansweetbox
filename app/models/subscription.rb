class Subscription < ActiveRecord::Base
  belongs_to :user

  validates :first_name, :last_name, :street_address,
            :city , :country, presence: true

  attr_accessor :stripe_card_token

  def save_with_payment
    if valid?
      user = Stripe::Customer.create(description:email, card: stripe_card_token)
      self.stripe_customer_token = user.id
      save!
    end
  end

end
