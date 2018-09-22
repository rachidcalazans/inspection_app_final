class CreateInspectionPhoto < ActiveRecord::Migration[5.2]
  def change
    create_table :inspection_photos do |t|
      t.references :inspection, foreign_key: true, null: false
      t.string :photo_url, null: false
      t.string :caption

      t.timestamps null: false
    end
  end
end
