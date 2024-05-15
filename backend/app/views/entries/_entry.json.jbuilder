json.extract! entry, :id, :surname, :name, :surnameKana, :nameKana, :gender, :birthday, :prefecture, :address, :email, :created_at, :updated_at
json.url entry_url(entry, format: :json)
