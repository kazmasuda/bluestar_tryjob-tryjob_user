class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)

    if @contact.valid?
      render :action => 'confirm'
    else
      render :action => 'index'
    end

  end

  def thanks
    @contact = Contact.new(contact_params)
    ContactMailer.sended_email(@contact).deliver
    render :action => 'thanks'
  end

  private

   def contact_params
     params.require(:contact).permit(:name, :enterprise, :post, :email, :tell, :message)
   end

end
