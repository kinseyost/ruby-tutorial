class SectionEdit < ApplicationRecord

  belongs_to :editor, :class_name => "AdminUser", :foreign_key => "admin_user_id" # because foreign key is not called editor_id
  belongs_to :section
end
