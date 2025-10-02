class CreateReadings < ActiveRecord::Migration[8.0]
  def change
    create_table :readings do |t|
      t.integer :status, default: 0, null: false
      t.date :started_at
      t.date :finished_at
      t.integer :rating
      t.text :review
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
