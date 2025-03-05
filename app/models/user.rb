class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  enum role: { client: 0, agent: 1, warehouse: 2, rider: 3, admin: 4 }
       validates :email, presence: true, uniqueness: true
    
        
end
