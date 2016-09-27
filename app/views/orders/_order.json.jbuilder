json.extract! order, :id, :thing_id, :orderer_id, :material_id, :unitary_price, :comment, :created_at, :updated_at
json.url order_url(order, format: :json)