json.extract! show, :id, :movie_id, :theatre_id, :show_date, :timing_id, :available_seats, :seat_price, :created_at, :updated_at
json.url show_url(show, format: :json)
