class AddDeletedAtToActors < ActiveRecord::Migration[6.0]
  def change
    add_column :actors, :deleted_at, :datetime
    add_index :actors, :deleted_at
  end
end
