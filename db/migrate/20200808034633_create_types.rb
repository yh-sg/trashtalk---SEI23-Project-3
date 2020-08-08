class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string :material
      t.string :remarks
      t.integer :weight

      t.timestamps
    end
  end
end
