class ChangeColumnNullPhoneKind < ActiveRecord::Migration[6.1]
  def change
    change_column_null :phones, :phone_kind, false
  end
end
