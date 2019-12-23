json.extract! manager, :id, :first_name, :last_name, :nickname, :email, :encrypted_password
json.url manager_url(manager, format: :json)