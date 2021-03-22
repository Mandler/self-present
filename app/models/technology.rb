class Technology < ApplicationRecord
  belongs_to :user

  MAX_LEVEL = 5
end
