class ClientsController < ApplicationController
  before_action :set_clients_object
  def index
    @clients = ClientSearcher.call(client_params, @client_data)

    render 'index'
  end

  def check_duplicate_mail
    @duplicate_mails = ClientSearcher.check_duplicate_mail(@client_data)

    render 'duplicate_mail'
  end

  private

  def set_clients_object
    @client_data = if request.body.read.blank?
                    JSON.parse(File.read('app/assets/clients.json'))
                  else
                    JSON.parse(request.body.read)
                  end
  end

  def client_params
    params.permit(:id, :first_name, :last_name, :email, :full_name).to_unsafe_hash
  end
end
