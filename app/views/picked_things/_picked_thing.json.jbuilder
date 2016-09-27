json.extract! picked_thing, :id, :user_id, :thing_id, :created_at, :updated_at
json.url picked_thing_url(picked_thing, format: :json)