class AddSessionIdToLines < ActiveRecord::Migration
  def change
    add_column :lines, :session_id, :string
    add_index :lines, :session_id
  end
end
