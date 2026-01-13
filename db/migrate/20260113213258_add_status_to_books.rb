class AddStatusToBooks < ActiveRecord::Migration[8.1]
  def change
    add_reference :books, :status, null: true, foreign_key: true
  end
end
