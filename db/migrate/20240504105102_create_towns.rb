class CreateTowns < ActiveRecord::Migration[6.1]
  def change
    create_table :towns do |t|
      t.string :image
      t.string :title
      t.text :content
      t.text :about

      t.timestamps
    end
  end
end
