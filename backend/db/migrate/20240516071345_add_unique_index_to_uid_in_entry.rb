class AddUniqueIndexToUidInEntry < ActiveRecord::Migration[7.1]
  def change
    add_index :entries, :uid, unique: true
  end
end
