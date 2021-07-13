class AddImportantToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :important, :text
  end
end
