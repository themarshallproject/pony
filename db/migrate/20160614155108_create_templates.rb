class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :title
      t.text :header
      t.text :footer

      t.timestamps null: false
    end
  end
end
