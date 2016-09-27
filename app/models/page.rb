class Page < ApplicationRecord

  belongs_to :subject
  # specify the correct table using class_name (with capital case)
  has_and_belongs_to_many :editors, :class_name => "AdminUser"
  # If join table has different name, you specify (in both sides of the relationship) like this:
  #  has_and_belongs_to_many :admin_users, :join_table => "admin_users_pages"

end
