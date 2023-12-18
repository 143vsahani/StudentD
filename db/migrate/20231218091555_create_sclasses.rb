class CreateSclasses < ActiveRecord::Migration[7.1]
  def change
    create_table :sclasses do |t|
      t.integer :classNumber
      t.string :department
      t.string :division
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
