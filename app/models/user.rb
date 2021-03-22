class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  has_many :technologies

  def full_name
    "#{first_name} #{last_name} [#{github_name}]"
  end

  def technologies_title
    technologies.map(&:title).join(', ')
  end
end
