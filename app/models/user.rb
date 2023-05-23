class User < ApplicationRecord

    has_one_attached :main_image
    has_many :appointments
    has_secure_password

    #validates :name, presence: true
    #validates :email, format: { with: /\S+@\S+/ }, uniqueness: { cas_sensitive: false }

    USEROLE = %w( Technician Customer )
    validates :role, inclusion: { in: USEROLE }

    #scope :customerpastapp, -> { where(appdate: where("appdate <= ?", Date.current).order("appdate desc")) }

end