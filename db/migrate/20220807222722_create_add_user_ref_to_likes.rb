class CreateAddUserRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end