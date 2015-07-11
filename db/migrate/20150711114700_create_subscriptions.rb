class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :unit
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
