class AppConfiguration < ActiveRecord::Base
  
  def hashify
    {
      :environemnt => environment,
      :user => user,
      :password => password,
      :email => email,
      :site_url => site_url
    }
  end
end
