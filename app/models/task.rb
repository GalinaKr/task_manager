class Task < ApplicationRecord
  validates :name, presence: true

  enum status: { in_progress: 0, done: 1 }
  belongs_to :project
end
