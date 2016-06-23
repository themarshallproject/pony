class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.integer :template_id
      t.string :title
      t.text :content

      t.timestamps null: false
    end
    add_index :emails, :template_id
  end
end
