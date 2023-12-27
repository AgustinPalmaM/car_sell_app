class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: :invalid }
  validates :username, presence: true, uniqueness: true,
                       length: { minimum: 3, maximum: 15 },
                       format: { with: /[a-z0-9]/i, message: :invalid }
  validates :password, length: { minimum: 6 }

  has_many :cars, dependent: :destroy

  before_save :downcase_attributes

  private

  def downcase_attributes
    self.username = username.downcase
    self.email = email.downcase
  end
end
