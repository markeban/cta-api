class CreateTrains < ActiveRecord::Migration
  def change
    create_table :trains do |t|
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
