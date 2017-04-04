class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :content

      t.timestamps
    end
    add_foreign_key :messages, :profiles, column: "sender_id"
    add_foreign_key :messages, :profiles, column: "receiver_id"
    add_index :messages, :sender_id
    add_index :messages, :receiver_id
  end
end
