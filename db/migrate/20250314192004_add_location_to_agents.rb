class AddLocationToAgents < ActiveRecord::Migration[7.0]
  def up
    # Step 1: Add column without NOT NULL constraint
    add_reference :agents, :location, foreign_key: true, null: true

    # Step 2: Assign a default location to existing agents (Adjust accordingly)
    default_location = Location.first || Location.create(name: "Default Location")
    Agent.where(location_id: nil).update_all(location_id: default_location.id)

    # Step 3: Now enforce NOT NULL constraint
    change_column_null :agents, :location_id, false
  end

  def down
    remove_reference :agents, :location
  end
end
