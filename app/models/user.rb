class User < ActiveRecord::Base
  attr_accessor :login

  # associations
  has_many :created_guides, class_name: "Guide", foreign_key: "creator_id"
  has_many :saved_guides

  # validations
  validates :username,
  :uniqueness => {
    :case_sensitive => false
  }

  # geocoder
  geocoded_by :ip_address

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :registerable, :rememberable, :trackable, :validatable

  # class methods

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
