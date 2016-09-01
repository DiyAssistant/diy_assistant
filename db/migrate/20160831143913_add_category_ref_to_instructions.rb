class AddCategoryRefToInstructions < ActiveRecord::Migration
  def change
    add_reference :instructions, :category, index: true, foreign_key: true
  end
end
