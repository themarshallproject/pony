class AddTokenToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :token, :string
    add_index :emails, :token
  end
end
