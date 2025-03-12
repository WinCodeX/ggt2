class Agent < ApplicationRecord
    has_many :sent_packages, class_name: "Package", foreign_key: "sender_agent_id"
    has_many :received_packages, class_name: "Package", foreign_key: "receiver_agent_id"
  
    validates :name, :location, presence: true
  end
  