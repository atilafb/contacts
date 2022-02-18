class AddDefaultValueToPhones < ActiveRecord::Migration[6.1]
  def change
    change_column :phones, :is_main, :boolean, default: false
  end
end
