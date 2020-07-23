class RemoveContentFromNotes < ActiveRecord::Migration[6.0]
  def change
    remove_column :notes, :content
  end
end
