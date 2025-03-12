class CreatePackages < ActiveRecord::Migration[7.1]
  def change
    create_table :packages do |t|
      t.string :recipient_name
      t.string :recipient_phone
      t.string :package_description
      t.decimal :package_value
      t.integer :sender_agent_id
      t.string :delivery_type
      t.text :delivery_details
      t.integer :receiver_agent_id
      t.string :exact_location
      t.string :courier_service
      t.string :destination
      t.string :state
      t.decimal :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
