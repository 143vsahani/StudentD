class CreateSchools < ActiveRecord::Migration[7.1]
  def change
    create_table :schools do |t|
      t.string :schoolName
      t.string :board
      t.string :principalName

      t.timestamps
    end
  end
end
