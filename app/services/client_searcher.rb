class ClientSearcher
  def self.call(params = {}, client_data)
    new(params, client_data).call
  end

  def self.check_duplicate_mail(client_data)
    new({}, client_data).check_duplicate_mail
  end

  def initialize(params = {}, client_data)
    @params = params
    @client_data = client_data
  end

  def call
    clients.ransack(search_criteria).result
  end

  def check_duplicate_mail
    clients.all.group_by(&:email).select { |k, v| v.size > 1 }
  end

  private

  attr_reader :params, :client_data

  def search_criteria
    hash = {}
    params.each do |key, value|
      hash["#{key}_cont"] = value if value.present?
    end
    hash.compact
  end

  def clients
    client_ids = []
    client_data.each do |client|
      first_name = client['full_name'].split(' ')[0..-2].join(' ')
      last_name = client['full_name'].split(' ')[-1]
      client = Client.find_or_create_by(first_name: first_name, last_name: last_name, email: client['email'], full_name: client['full_name'], secondary_id: client['id'])
      client_ids << client[:id]
    end
    @clients ||= Client.where(id: client_ids)
  end
end