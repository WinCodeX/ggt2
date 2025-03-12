class User < ApplicationRecord
       before_validation :ensure_unique_username, on: :create
     
       has_one :business, dependent: :destroy
        has_one_attached :profile_picture
      
      
       devise :database_authenticatable, :registerable,
              :recoverable, :rememberable, :validatable
     
       enum role: { client: 0, agent: 1, warehouse: 2, rider: 3, admin: 4 }
     
       validates :email, presence: true, uniqueness: true
       validates :username, presence: true, uniqueness: true
     
       before_create :set_default_role
     
       private
     
       def set_default_role
         self.role ||= :client
       end
       
       def update_profile_picture(image)
        profile_picture.attach(image)
        save
      end
     
       def ensure_unique_username
         base_username = self.username.strip
         count = User.where("username LIKE ?", "#{base_username}%").count
     
         if count > 0
           # Ensure unique username with a random number
           self.username = "#{base_username}#{rand(1000..9999)}"
         end
       end
     end
     