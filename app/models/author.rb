class Author < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 1 }
  validates :last_name, presence: true, length: { minimum: 1 }
  validates :homepage, presence: true, length: { minimum: 1 }

  def name
    self.first_name + " " + self.last_name
  end
end
