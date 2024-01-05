class RemoveForeignKey < ActiveRecord::Migration[7.1]
  def change
    # remove the old foreign_key
    remove_foreign_key :sclasses,  :schools
  end
end
