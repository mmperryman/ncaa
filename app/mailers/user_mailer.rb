class UserMailer < ActionMailer::Base
  default :from => "mmperryman@gmail.com"
  
  def update_email(user)
    @user = user
    @url  = "http://themovinggoalpost.heroku.com"
    mail(:to => user.email,
         :subject => "Greetings from TheMovingGoalPost Pool!")
  end
  
  def forgot_password(user)
    from          "Binary Logic Notifier <noreply@binarylogic.com>"

    @reset_password_link = reset_password_url(user.perishable_token)

    mail(:to => user.email,
         :subject => "Password Reset",
         :from => from,
         :fail_to => from
    ) do |format|
      format.text
    end
  end
end
