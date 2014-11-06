class EmailsController < ApplicationController
    before_action :load_email, only: [:edit, :update, :destroy]

  def index
    @emails = Email.all
  end

  def new
    @email = Email.new
  end

  def create
    @email = Email.new(email_params)
    if @email.save
      redirect_to emails_url, notice: 'New Email is created.'
    else
      render 'new', alert: 'Email cannot be created.'
    end
  end

  def edit
  end

  def update
    if @email.update(email_params)
      redirect_to emails_url, notice: 'Email is updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    if @email.destroy
      flash[:notice] = 'Email is deleted.'
    else
      flash[:alert] = 'Email cannot be deleted.'
    end
    redirect_to emails_url
  end

  private
  def load_email
    @email = Email.find(params[:id])
  end

  def email_params
    params.require(:email).permit(:subject, :content)
  end

end