class AddLakeToSecchi < ActiveRecord::Migration
  def change
    add_reference :secchis, :lake, index: true
    add_foreign_key :secchis, :lakes
  end
end
