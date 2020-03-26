class BookingRequested

  def self.all(customer_id)
    @bookings_requested = ActiveRecord::Base.connection.execute("SELECT s.name, s.price, s.description, s.street_address, s.city, s.country, s.postcode, b.confirmation, b.booking_start, b.booking_end FROM spaces s LEFT JOIN bookings b ON s.id = b.space_id WHERE b.customer_id = #{customer_id}")

    @bookings_requested.map do |request|
      # p request
      BookingRequested.new(
        space_name: request['name'],
        space_price: request['price'],
        space_description: request['description'],
        space_street_address: request['address'],
        space_city: request['city'],
        space_country: request['country'],
        space_post_code: request['postcode'],
        booking_confirmation: request['confirmation'],
        booking_start_date: request['booking_start'],
        booking_end_date: request['booking_end']
      )
    end
  end

  attr_reader :space_name, :space_price, :space_description, :space_street_address, :space_city, :space_country, :space_post_code, :booking_confirmation, :booking_start_date, :booking_end_date

  def initialize(space_name:, space_price:, space_description:, space_street_address:, space_city:, space_country:, space_post_code:, booking_confirmation:, booking_start_date:, booking_end_date:)
    @space_name = space_name
    @space_price = space_price
    @space_description = space_description
    @space_street_address = space_street_address
    @space_city = space_city
    @space_country = space_country
    @space_post_code = space_post_code
    @booking_confirmation = booking_confirmation
    @booking_start_date = booking_start_date
    @booking_end_date = booking_end_date
  end

end
