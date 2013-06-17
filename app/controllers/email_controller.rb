class EmailController < ApplicationController
  def index

    @toAddress = @ccAddress = @bccAddress = @fromAddress = @subject = @body = ''
    
    if request.post?
      to = params[:toAddress]
      cc = params[:ccAddress]
      bcc = params[:bccAddress]
      from = params[:fromAddress]
      subject = params[:subject]
      body = params[:body]
      
      begin
        response = SendgridMailer.email(to, from, subject, body, cc, bcc).deliver
        flash[:message] = "Your email was successfully sent."
        flash[:class] = ' alert-success'
        redirect_to :controller=>'email', :action => 'index'
      rescue Exception => e
        logger.debug "Send email failed: #{e}"
        flash.now[:message] = e.message
        @toAddress = to
        @ccAddress = cc
        @bccAddress = bcc
        @fromAddress = from
        @subject = subject
        @body = body
        flash.now[:class] = ' alert-error'
      end
    end    
  end
end 
