require('spec_helper')

describe(Venue) do

  it('validates presence of name') do
    venue = Venue.new(venue_name: '')
    expect(venue.save).to(eq(false))
  end

  it('validates name is 50 or fewer characters') do
    venue = Venue.new(venue_name: 'b'*(51))
    expect(venue.save).to(eq(false))
  end
end
