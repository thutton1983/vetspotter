class Review < ApplicationRecord
  belongs_to :user
  belongs_to :Veterinarian, optional: true

end
