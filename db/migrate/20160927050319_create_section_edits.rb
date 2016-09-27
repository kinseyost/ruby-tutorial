class CreateSectionEdits < ActiveRecord::Migration[5.0]

  def change
    create_table :section_edits do |t| # rich many-to-many does require primary key
      t.references :admin_user
      t.references :section
      t.string :summary
      t.timestamps
    end
  end

end
