class AdminUser < ApplicationRecord

  has_and_belongs_to_many :pages
  has_many :section_edits

    # To configure a different table name.
    # self.table_name = "admin_users"

    # ApplicationRecord already knows about the table because it is inheriting from ActiveRecord::Base
end
