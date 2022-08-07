class CreateAddPostRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
