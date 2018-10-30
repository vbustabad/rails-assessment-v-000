class User < ApplicationRecord
  has_secure_password
  has_one :owner

  validates :name, uniqueness: true
  validates :email, uniqueness: true
  validates :admin, inclusion: { in: [true, false] }

  def self.build_with_omniauth(auth)
    new(
      provider: auth["provider"],
      uid: auth["uid"],
      name: auth["info"]["name"],
      email: auth["info"]["email"]
    )
  end
  
  def dog
    self.owner.adoption.dog if has_dog?
  end

  def has_dog?
    self.owner.try(:adoption).try(:dog)
  end
end
