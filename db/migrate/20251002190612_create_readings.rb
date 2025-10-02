class CreateReadings < ActiveRecord::Migration[8.0]
  def change
    create_table :readings do |t|
      t.integer :status
      t.date :started_at
      t.date :finished_at
      t.integer :rating
      t.text :review

      t.timestamps
    end
  end
end
