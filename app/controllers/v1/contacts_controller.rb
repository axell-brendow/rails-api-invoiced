class V1::ContactsController < V1::ApplicationController
  def index
    @contacts = Contact.all

    render json: @contacts, status: :ok
  end

  def create
    @contact = Contact.new(contact_params)

    @contact.save

    render json: @contact, status: :created
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    head(:no_content)
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email)
  end
end
