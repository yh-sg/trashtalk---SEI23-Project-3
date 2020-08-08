class ChangeWeightToFloat < ActiveRecord::Migration[6.0]
  def self.up
    change_column :types, :weight, :float
  end

  def self.down
    change_column :types, :weight, :integer
  end
end
