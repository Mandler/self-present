class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  def full_name
    "#{first_name} #{last_name} [#{github_name}]"
  end
end
