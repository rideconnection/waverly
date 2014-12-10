collection @uploaded_trips, root: "list", object_root: "trip"
node do |trip|
  {
    client: {
      prime: trip.prime_number,
      last: trip.client_last,
      first: trip.client_first,
      mi: trip.client_mi
    }
  }
end
attribute trip_id: :tripId
attribute service_date: :servicedate
attribute pickup_time: :pickupTime
attribute appt_time: :apptTime
node do |trip|
  {
    pickup: {
      name: trip.pickup_name,
      address: trip.pickup_address,
      city: trip.pickup_city,
      state: trip.pickup_state,
      zip: trip.pickup_zip
    }
  }
end
node do |trip|
  {
    dropoff: {
      name: trip.dropoff_name,
      address: trip.dropoff_address,
      city: trip.dropoff_city,
      state: trip.dropoff_state,
      zip: trip.dropoff_zip
    }
  }
end
attributes :reason, :status, :mode, :mileage
