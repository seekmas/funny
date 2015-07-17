json.array!(@invite_letters) do |invite_letter|
  json.extract! invite_letter, :id, :user_id, :email_list, :email_content
  json.url invite_letter_url(invite_letter, format: :json)
end
