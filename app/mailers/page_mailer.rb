class PageMailer < ActionMailer::Base

   default :to => "dogwalkzombie@gmail.com",
           :from => "admin@cairnbrain.com"
   

  def PageChange(page)
   @page = page
   mail(:subject => "A Page has been Created or Updated")
  end
  
  def DeletePage(page)
   @page = page
   mail(:subject => "A Page has been Deleted")
  end
end

