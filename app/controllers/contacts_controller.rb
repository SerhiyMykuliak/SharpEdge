class ContactsController < ApplicationController

  def send_message
    
    ContactMailer.contact_email(params[:email], params[:message]).deliver_now

    flash[:notice] = 'Ваше повідомлення було успішно надіслано.'
    redirect_back fallback_location: root_path
  rescue StandardError => e
    flash[:alert] = "Сталася помилка: #{e.message}. Спробуйте ще раз."
    redirect_back fallback_location: root_path
    
  end 
end
