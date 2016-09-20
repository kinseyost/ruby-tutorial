class CreateSections < ActiveRecord::Migration[5.0]
  # Example of change action, will only work if all commands on up are reversible.
  def change
    create_table :sections do |t|
      t.references :page
      
      t.string "name"
      t.integer "position"
      t.boolean "visible", :default => false
      t.string "content_type"
      t.text "content"
      t.timestamps
    end
  end
end
