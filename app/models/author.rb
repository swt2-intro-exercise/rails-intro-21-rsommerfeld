class Author < ApplicationRecord
  has_many :papers

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :homepage, presence: true

  def name
    self.first_name + " " + self.last_name
  end
end
