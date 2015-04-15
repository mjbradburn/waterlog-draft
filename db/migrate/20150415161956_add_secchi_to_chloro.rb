class AddSecchiToChloro < ActiveRecord::Migration
  def change
    add_reference :chloros, :secchi, index: true
    add_foreign_key :chloros, :secchis
  end
end
