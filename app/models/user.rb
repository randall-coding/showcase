class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable
  devise :database_authenticatable, :rememberable, :validatable, :trackable, :lockable

  before_create :validate_only_one

  private
  def validate_only_one
    if User.count >= 1
      errors.add(:base, "There can be only one!")
      throw :abort
    end
  end
end
