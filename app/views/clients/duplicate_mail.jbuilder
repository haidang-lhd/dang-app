json.success true
if @duplicate_mails
  json.duplicate_mail @duplicate_mails do |mail, clients|
    json.mail mail
    json.clients clients do |client|
      json.id client.secondary_id
      json.full_name client.full_name
      json.email client.email
      json.first_name client.first_name
      json.last_name client.last_name
    end
  end
else
  json.duplicate_mail 'No duplicate mails found'
end