class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  has_one :profile, dependent: :destroy
  after_create :create_default_profile
  
  has_many :addresses, dependent: :destroy

  private

  def create_default_profile
    create_profile
  end
end
