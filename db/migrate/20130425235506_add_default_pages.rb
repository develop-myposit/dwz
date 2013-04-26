class AddDefaultPages < ActiveRecord::Migration
  def up
      if Page.all.empty?
         Page.create(:name => 'home', :title => 'Home', :navlabel => 'Home', :position => 1,
                     :admin => false,
                     :body => '# Welcome to our home page - Heading 1\n\n##Sample H2...',
                     :navlabel: => "Home")
        Say "Added Home Page"
        Page.create(:name => 'about', :title => 'About the Learning Rails Sample Application', :navlabel => 'About', :position => 2,
                     :admin => false,
                     :body => '# This is the about us page\r\n')
        Say "Added About Page"
        Page.create(:name => 'resources', :title => 'Learning Rails Resources', :navlabel => 'Resources', :position => 3,
                    :admin => false,
                    :body =>  "# Resources\r\n## More")
        Say "Added Resources Page"
        Page.create(:name => 'contact', :title => 'Contact Us', :navlabel => 'Contact Us', :position => 4,
                    :admin => false,
                    :body: "### At CairnBrain We always listen to our customers. \r\n\r\n[Contact us here](/messages/new)")
        Say "Added Contact Page"
        Page.create(:name => 'admin', :title => 'Administration', :navlabel => 'Admin', :position => 5,
                    :admin => true, 
                    :body => "## Admin Dashboard\r\n\r\n[Pages Admin] (/pages)\r\n\r\n[Users Admin] (/users)\r\n\r\n[Message Admin](/messages)\r\n")
         Say "Added Administration Page"
         Page.create(:name => 'services', :title => 'Services', :navlabel => 'Services',
                     :admin => false, 
                     :redirect => false,
                     :body => "# Who we are\r\n##Who we were",
                     :parent_id =>2)
         Say "Added Services Sub Page"

        end
  end

  def down
     Page.delete_all
     Say "Pages have been purged from the Pages Model"
  end
end
