class CreateSecchis < ActiveRecord::Migration
  def change
    create_table :secchis do |t|
      t.datetime "sample_time"
      t.decimal "secchi_depth_ft"
      t.integer "weather"
      t.text "comments"
      t.timestamps null: false
    end
  end
end
