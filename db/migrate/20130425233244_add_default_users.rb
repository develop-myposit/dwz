class AddDefaultUsers < ActiveRecord::Migration
  def up
   puts 'DEFAULT USERS'
   say "Checking to see if #{ENV['ADMIN_EMAIL']} exists"
   user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup,
                                       :email => ENV['ADMIN_EMAIL'].dup,
                                       :password => ENV['ADMIN_PASSWORD'].dup,
                                       :password_confirmation => ENV['ADMIN_PASSWORD'].dup
   puts 'user: ' << user.name
   say "#{ENV['ADMIN_EMAIL']} has been created" 
  end

  def down
    say "Checking to see if #{ENV['ADMIN_EMAIL']} exists"
    if User.exists?(:email =>ENV["ADMIN_EMAIL"])
       @user = User.find_by_email(:login =>ENV["ADMIN_EMAIL"])
       @user.destroy
       say "#{ENV['ADMIN_EMAIL']} has been deleted"
    end
    say "Migration Complete"
  end
end
