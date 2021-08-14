class User < ApplicationRecord
    has_many :stories
    has_secure_password
    validates :email, presence: true, uniqueness: {case_sensitive: :true}
end
#lo anterior evalua la precencia y que sea sentivo a las mayusculas 