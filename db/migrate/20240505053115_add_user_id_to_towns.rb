class AddUserIdToTowns < ActiveRecord::Migration[6.1]
  def change
    add_column :towns, :user_id, :integer
  end
end
