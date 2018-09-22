class CreateInspection < ActiveRecord::Migration[5.2]
  def change
    create_table :inspections do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
