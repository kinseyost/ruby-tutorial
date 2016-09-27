class Subject < ApplicationRecord

  # Relations
  has_one :page # Doesn't actually have 1, but showing for demonstration purposes

  # Lamda is read at execution time, which is important for dates.
  scope :visible, lambda { where(:visible => true) }
  # Stabby lambda syntax is subtly different, but can also be used.
  scope :invisible, -> { where(:visible => false) }
  scope :sorted, lambda { order("subjects.position ASC") }
  scope :newest_first, lambda { order("subjects.created_at DESC") }
  scope :search, lambda { |query|
    where(["name LIKE ?", "%${query}%"])
  }

end
