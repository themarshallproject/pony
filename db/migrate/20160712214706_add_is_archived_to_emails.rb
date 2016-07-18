class AddIsArchivedToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :is_archived, :boolean
    add_index :emails, :is_archived
  end
end
