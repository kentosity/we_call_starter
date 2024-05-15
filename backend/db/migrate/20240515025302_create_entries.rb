class CreateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :entries do |t|
      t.string :surname
      t.string :name
      t.string :surnameKana
      t.string :nameKana
      t.string :gender
      t.string :birthday
      t.string :prefecture
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
