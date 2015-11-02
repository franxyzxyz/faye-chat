class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :handle
      t.string :text

      t.timestamps null: false
    end
  end
end
