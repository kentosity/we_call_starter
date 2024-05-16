class AddUidToEntry < ActiveRecord::Migration[7.1]
  def change
    add_column :entries, :uid, :string
  end
end
