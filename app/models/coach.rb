class Coach < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :practices
  belongs_to :user

  validates :name, :team, :age_group, :state, :email, :phone, :user_id, presence: :true
  validates_processing_of :avatar
  validate :avatar_size_validation

private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    coach = Coach.find_by(email: email)
    if coach && coach.authenticate(password)
      coach
    else
      nil
    end
  end

  # User Avatar Validation

  private
    def avatar_size_validation
      errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
    end

end
