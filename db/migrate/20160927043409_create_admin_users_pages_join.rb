class CreateAdminUsersPagesJoin < ActiveRecord::Migration[5.0]

  def up
    create_table :admin_users_pages, :id => false do |t| # Remove the primary key **Very important
      t.refereneces :page
      t.refereneces :admin_user
    end
  end

  def down
    drop_table :admin_users_pages
  end

end
