class Subscription < ActiveRecord::Base
  belongs_to :user

  validates :first_name, :last_name, :street_address,
            :unit, :city , :country, :postal_code,
            presence: true

end
