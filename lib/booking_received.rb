class BookingReceived

  def self.all(owner_id)
    @bookings_received = ActiveRecord::Base.connection.execute("SELECT s.name, s.price, s.description, s.street_address, s.city, s.country, s.postcode, b.id booking_id, b.confirmation, b.booking_start, b.booking_end FROM spaces s INNER JOIN bookings b ON s.id = b.space_id WHERE s.owner_id = #{owner_id}")

    @bookings_received.map do |request|
      # p request
      BookingReceived.new(
        space_name: request['name'],
        space_price: request['price'],
        space_description: request['description'],
        space_street_address: request['address'],
        space_city: request['city'],
        space_country: request['country'],
        space_post_code: request['postcode'],
        booking_confirmation: request['confirmation'],
        booking_start_date: request['booking_start'],
        booking_end_date: request['booking_end'],
        booking_id: request['booking_id']
      )
    end
  end

  attr_reader :space_name, :space_price, :space_description, :space_street_address, :space_city, :space_country, :space_post_code, :booking_confirmation, :booking_start_date, :booking_end_date, :booking_id

  def initialize(space_name:, space_price:, space_description:, space_street_address:, space_city:, space_country:, space_post_code:, booking_confirmation:, booking_start_date:, booking_end_date:, booking_id:)
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
    @booking_id = booking_id
  end

end
