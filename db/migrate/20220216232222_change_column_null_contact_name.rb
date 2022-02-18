class ChangeColumnNullContactName < ActiveRecord::Migration[6.1]
  def change
    change_column_null :contacts, :name, false
  end
end
