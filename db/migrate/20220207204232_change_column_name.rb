class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :phones, :is_main?, :is_main
  end
end
