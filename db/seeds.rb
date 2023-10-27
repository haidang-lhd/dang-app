# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

clients = [
  {
    "id": 1,
    "full_name": "John Doe",
    "email": "john.doe@gmail.com"
  },
  {
    "id": 2,
    "full_name": "Jane Smith",
    "email": "jane.smith@yahoo.com"
  },
  {
    "id": 3,
    "full_name": "Alex Johnson",
    "email": "alex.johnson@hotmail.com"
  },
  {
    "id": 4,
    "full_name": "Michael Williams",
    "email": "michael.williams@outlook.com"
  },
  {
    "id": 5,
    "full_name": "Emily Brown",
    "email": "emily.brown@aol.com"
  },
  {
    "id": 6,
    "full_name": "William Davis",
    "email": "william.davis@icloud.com"
  },
  {
    "id": 7,
    "full_name": "Olivia Miller",
    "email": "olivia.miller@protonmail.com"
  },
  {
    "id": 8,
    "full_name": "James Wilson",
    "email": "james.wilson@yandex.com"
  },
  {
    "id": 9,
    "full_name": "Ava Taylor",
    "email": "ava.taylor@mail.com"
  },
  {
    "id": 10,
    "full_name": "Michael Brown",
    "email": "michael.brown@inbox.com"
  },
  {
    "id": 11,
    "full_name": "Sophia Garcia",
    "email": "sophia.garcia@zoho.com"
  },
  {
    "id": 12,
    "full_name": "Emma Lopez",
    "email": "emma.lopez@protonmail.ch"
  },
  {
    "id": 13,
    "full_name": "Liam Martinez",
    "email": "liam.martinez@fastmail.fm"
  },
  {
    "id": 14,
    "full_name": "Isabella Rodriguez",
    "email": "isabella.rodriguez@me.com"
  },
  {
    "id": 15,
    "full_name": "Jane Smith",
    "email": "jane.smith@gmail.com"
  }
]

clients.each do |client|
  first_name = client[:full_name].split(' ')[0..-2].join(' ')
  last_name = client[:full_name].split(' ')[-1]
  Client.create(first_name: first_name, last_name: last_name, email: client[:email])
end

