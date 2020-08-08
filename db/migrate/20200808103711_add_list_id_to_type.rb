class AddListIdToType < ActiveRecord::Migration[6.0]
  def change
    add_reference :types, :list, null: false, foreign_key: true
  end
end
