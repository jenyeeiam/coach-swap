class Coach < ApplicationRecord

  has_secure_password
  has_many :practices

  validates :name, presence: true
  validates :team, presence: true
  validates :age_group, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :password_digest, presence: true

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    coach = Coach.find_by(email: email)
    if coach && coach.authenticate(password)
      coach
    else
      nil
    end
  end

end
