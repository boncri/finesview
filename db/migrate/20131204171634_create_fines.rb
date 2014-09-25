class CreateFines < ActiveRecord::Migration
  def change
    create_table :fines do |t|
      t.string :number
      t.string :plate
      t.datetime :taken_at
      t.integer :amount

      t.timestamps
    end
  end
end
