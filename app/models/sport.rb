class Sport < ApplicationRecord
  has_many :trainings, dependent: :destroy
end
