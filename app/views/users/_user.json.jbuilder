json.extract! user, :first_name, :last_name, :email, :encrypted_password, :reset_password_token, :birthday, :geneder, :is_deleted, :is_blocked, :phone
json.url user_url(user, format: :json)