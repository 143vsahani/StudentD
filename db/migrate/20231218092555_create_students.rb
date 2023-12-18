class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.integer :rollNumber
      t.string :studentClass
      t.string :fatherName
      t.references :sclass, null: false, foreign_key: true

      t.timestamps
    end
  end
end
