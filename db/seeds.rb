# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#
   puts "Checking to see if #{ENV['ADMIN_EMAIL']} exists"
   user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup,
                                       :email => ENV['ADMIN_EMAIL'].dup,
                                       :password => ENV['ADMIN_PASSWORD'].dup,
                                       :password_confirmation => ENV['ADMIN_PASSWORD'].dup
   puts "#{ENV['ADMIN_EMAIL']} has been created" 
   p = Page.create(:name => 'home', :title => 'Home', :navlabel => 'Home', :position => 1,
                     :admin => false,
                     :body => '# Welcome to our home page - Heading  ##Sample H2...')
   puts "#{p.title} page has been created"
   p=Page.create(:name => 'about', :title => 'About the Learning Rails Sample Application', :navlabel => 'About', :position => 2,
                     :admin => false,
                     :body => '# This is the about us page')
   puts "#{p.title} page has been created"
   p=Page.create(:name => 'resources', :title => 'Learning Rails Resources', :navlabel => 'Resources', :position => 3,
                    :admin => false,
                    :body =>  "# Resources  ## More")
   puts "#{p.title} page has been created"
   p=Page.create(:name => 'contact', :title => 'Contact Us', :navlabel => 'Contact Us', :position => 4,
                    :admin => false,
                    :body => "### At CairnBrain We always listen to our customers.  [Contact us here](/messages/new)")
   puts "#{p.title} page has been created"
   p=Page.create(:name => 'admin', :title => 'Administration', :navlabel => 'Admin', :position => 5,
                    :admin => true, 
                    :body => "## Admin Dashboard  [Pages Admin](/pages)  [Users Admin](/users)  [Message Admin](/messages)")
   puts "#{p.title} page has been created"
   p=Page.create(:name => 'services', :title => 'Services', :navlabel => 'Services',
                     :admin => false, 
                     :body => "# Who we are  ##Who we were",
                     :parent_id =>2)
   puts "#{p.title} subpage has been created"