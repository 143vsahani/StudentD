class AddAssignmentsAndStatusToSclasses < ActiveRecord::Migration[7.1]
  def change
    add_column :sclasses, :assignments, :binary
    add_column :sclasses, :status, :string
  end
end
