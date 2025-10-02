class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :first_publish_year
      t.text :summary
      t.integer :pages
      t.string :language

      t.timestamps
    end
  end
end
