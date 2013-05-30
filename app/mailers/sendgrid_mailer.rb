class SendgridMailer < ActionMailer::Base

  def email(to, from, subject, body)
    mail(:to => to, :from => from, :subject => subject) do |format|
      format.text { render :text => body }
      format.html { render :text => body }
    end
  end
  
end
