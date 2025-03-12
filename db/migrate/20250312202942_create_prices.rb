class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.references :sender_agent, null: false, foreign_key: { to_table: :agents }
      t.references :receiver_agent, null: false, foreign_key: { to_table: :agents }
      t.decimal :cost, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
