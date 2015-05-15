require('spec_helper')

describe(Band) do
    it('has many venues') do
      band = Band.create(name: 'red')
      venue1 = Venue.create(venue_name: 'hilton', band_ids: [band.id])
      venue2 = Venue.create(venue_name: 'ramada', band_ids: [band.id])
      expect(band.venues).to(eq([venue1, venue2]))
    end


  it('validates presence of name') do
    ingredient = Band.new(name: '')
    expect(ingredient.save).to(eq(false))
  end

  it('validates name is 50 or fewer characters') do
    band = Band.new(name: 'b'*(51))
    expect(band.save).to(eq(false))
  end
end
