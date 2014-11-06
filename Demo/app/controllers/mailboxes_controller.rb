class MailboxesController < ApplicationController
  before_action :load_mailbox, only: [:edit, :update, :destroy]

  def index
    @mailboxes = Mailbox.all
  end

  def new
    @mailbox = Mailbox.new
  end

  def create
    @mailbox = Mailbox.new(mailbox_params)
    if @mailbox.save
      redirect_to mailboxes_url, notice: 'New Mailbox is created.'
    else
      render 'new', alert: 'Mailbox cannot be created.'
    end
  end

  def edit
  end

  def update
    if @mailbox.update(mailbox_params)
      redirect_to mailboxes_url, notice: 'Mailbox is updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    if @mailbox.destroy
      flash[:notice] = 'Mailbox is deleted.'
    else
      flash[:alert] = 'mailbox cannot be deleted.'
    end
    redirect_to mailboxes_url
  end

  private
  def load_mailbox
    @mailbox = Mailbox.find(params[:id])
  end

  def mailbox_params
    params.require(:mailbox).permit(:firstname, :lastname, :email)
  end
end
