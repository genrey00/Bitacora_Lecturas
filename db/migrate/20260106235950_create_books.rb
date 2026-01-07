class CreateBooks < ActiveRecord::Migration[8.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :name_author
      t.string :last_name_author
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
