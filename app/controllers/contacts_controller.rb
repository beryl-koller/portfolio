class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      redirect_to root_path, notice: 'Merci, votre message a bien été envoyé. Je reviendrai vers vous très rapidement.'
    else
      flash.now[:error] = 'Cannot send message'
      render :new
    end
  end
end
