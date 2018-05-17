class ModifyBelonging < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :belonging, :string
  end
end
