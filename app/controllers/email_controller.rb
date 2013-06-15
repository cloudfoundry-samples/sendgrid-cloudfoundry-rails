class EmailController < ApplicationController
  def index
    @error = ' hide'
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
      rescue Exception => @e
        logger.debug "Send email failed: #{@e}"
        @toAddress = to
        @ccAddress = cc
        @bccAddress = bcc
        @fromAddress = from
        @subject = subject
        @body = body
        @error = ''
      end
    end    
  end
end
