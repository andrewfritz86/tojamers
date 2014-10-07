class RemoveDescriptionLimit < ActiveRecord::Migration
  def change
    change_column :stories, :personal_description, :text, :limit => nil
    change_column :stories, :business_description, :text, :limit => nil
  end
end
