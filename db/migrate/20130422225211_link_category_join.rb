class LinkCategoryJoin < ActiveRecord::Migration
  def up
     create_table :categories_links, :id => false do |t|
        t.integer :category_id
        t.integer :link_id
     end
  end

  def down
     drop_table :categories_links
  end
end
