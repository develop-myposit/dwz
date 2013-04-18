class Page < ActiveRecord::Base

   has_many :subpages, :class_name => 'Page', :foreign_key => 'parent_id'
   belongs_to :parent, :class_name => 'Page', :foreign_key => 'parent_id'

   def self.find_main
      Page.where('parent_id IS NULL').order('position')
   end

   def self.list_title_options 
      Page.where('parent_id IS NULL').select("id, title").map {|x| [x.id, x.title] }
   end
   
   def self.find_main_public
      Page.where("parent_id IS NULL and admin !=?", true).order("position")
   end
end
