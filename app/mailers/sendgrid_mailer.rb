class SendgridMailer < ActionMailer::Base

  def email(to, from, subject, body, cc = nil, bcc = nil)
    mail(:to => to, :from => from, :subject => subject, :cc => cc, :bcc => bcc) do |format|
      format.text { render :text => body }
      format.html { render :text => body }
    end
  end
  
end
