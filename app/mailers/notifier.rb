class Notifier < ActionMailer::Base
  def forgot_password(user)
    from = "The HBC <mmperryman@gmail.com>"
  
    @reset_password_link = reset_password_url(user.persistence_token)
  
    mail(:to => user.email,
         :subject => "Password Reset",
         :from => from,
         :fail_to => from
    ) do |format|
      format.html
    end
  end
end