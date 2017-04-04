class Trainer < ApplicationRecord
  belongs_to :profile, optional: true
end
