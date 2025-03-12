class Price < ApplicationRecord
  belongs_to :sender_agent, class_name: "Agent"
  belongs_to :receiver_agent, class_name: "Agent"
end
