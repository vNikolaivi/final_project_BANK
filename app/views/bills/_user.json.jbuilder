json.extract! bill, :user_name, :bill_type, :amount, :bill_status, :created_date
json.url bill_info_url(bill, format: :json)