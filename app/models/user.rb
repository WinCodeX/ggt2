class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :business, dependent: :destroy, required: false
     
         
  enum role: { client: 0, agent: 1, warehouse: 2, rider: 3, admin: 4 }
       validates :email, presence: true, uniqueness: true
   before_create :set_default_role
private

       def set_default_role
         self.role ||= :client
       end
        
end