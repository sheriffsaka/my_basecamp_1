class AddAttachementToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :attachment, :string
  end
end
