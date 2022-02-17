class RenameColumnIsMain < ActiveRecord::Migration[6.1]
  def change
    rename_column :phones, :is_main, :principal
  end
end
