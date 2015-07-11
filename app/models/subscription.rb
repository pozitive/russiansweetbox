class Subscription < ActiveRecord::Base
  belongs_to :user

  validates :first_name, :last_name, :street_address,
            :city , :country, :unit, presence: true

  attr_accessor :stripe_card_token

  def save_with_payment
    if valid?
      user = Stripe::Customer.create(description: first_name, card: stripe_card_token)
      self.stripe_customer_token = user.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
  end

end
