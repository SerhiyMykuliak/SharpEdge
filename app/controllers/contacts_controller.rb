class ContactsController < ApplicationController

  def send_message
    if params[:email].blank? || params[:message].blank?
      flash[:alert] = 'Email and message are required fields.'
      redirect_back fallback_location: root_path
      return
    end

    ContactMailer.contact_email(params[:email], params[:message]).deliver_now

    flash[:notice] = 'Your message has been sent successfully.'
    redirect_back fallback_location: root_path
  rescue StandardError => e
    flash[:alert] = "An error occurred: #{e.message}. Please try again."
    redirect_back fallback_location: root_path
  end
end
