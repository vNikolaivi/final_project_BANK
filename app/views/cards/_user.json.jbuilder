json.extract! card, :id, :card_number, :security_type, :security_code, :expires_end, :created_at, :updated_at
json.url card_url(card, format: :json)