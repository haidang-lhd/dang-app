class ClientsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_clients_object
  def filter_clients
    @clients = ClientSearcher.call(client_params, @client_data)

    render 'index'
  end

  def check_duplicate_mail
    @duplicate_mails = ClientSearcher.check_duplicate_mail(@client_data)

    render 'duplicate_mail'
  end

  private

  def set_clients_object
    @client_data = if params[:_json].blank? # request.body.read.blank?
                    JSON.parse(File.read('app/assets/clients.json'))
                   else
                     params[:_json]
                     # JSON.parse(request.body.read)
                   end
  rescue standardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def client_params
    params.permit(:id, :first_name, :last_name, :email, :full_name).to_unsafe_hash
  end
end
