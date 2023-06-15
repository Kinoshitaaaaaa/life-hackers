class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :introduction, null: false
      t.boolean :is_deleted, default: false, null:false

      t.timestamps
    end
  end
end
