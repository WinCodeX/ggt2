class Package < ApplicationRecord
  belongs_to :user
  belongs_to :sender_agent, class_name: "Agent", optional: true
  belongs_to :receiver_agent, class_name: "Agent", optional: true

  enum state: {
    pending_unpaid: "pending_unpaid",
    pending: "pending",
    received_at_agent: "received_at_agent",
    in_warehouse: "in_warehouse",
    on_transit: "on_transit",
    delivered_to_agent: "delivered_to_agent",
    delivered_to_customer: "delivered_to_customer",
    delivered_to_courier: "delivered_to_courier"
  }

  validates :recipient_name, :recipient_phone, :package_description, :package_value, :delivery_type, presence: true
end
