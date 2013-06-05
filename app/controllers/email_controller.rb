class EmailController < ApplicationController
  def index
    if request.post?
      toName = params[:toName]
      toAddress = params[:toAddress]
      fromName = params[:fromName]
      fromAddress = params[:fromAddress]
      subject = params[:subject]
      body = params[:body]
      
      # add to name if exists
      if !toName.blank? 
        to = "#{toName}<#{toAddress}>"
      else
        to = toAddress        
      end
      
      # add from name if exists
      if !fromName.blank? 
        from = "#{fromName}<#{fromAddress}>"
      else
        from = fromAddress                
      end
      
      begin
        response = SendgridMailer.email(to, from, subject, body).deliver
      rescue Exception=>e
        logger.debug "Send email failed: #{e}"
      end
    end    
  end
end
