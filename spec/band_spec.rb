require('spec_helper')

describe(Band) do
  describe('#venue') do
    it('returns the venues of a band') do
      test_band = Band.create({:title => 'Jane'})
      test_venue = Venue.create({:name => 'field', :recipe_id => test_band.id()})
      test_venue2 = Venue.create({:name => 'lot', :recipe_id => test_band.id()})
      expect(test_band.venues()).to(eq([test_venue, test_venue2]))
    end
  end

  it('validates presence of title') do
    test_band = Band.create({:title => ''})
    expect(test_band.save()).to(eq(false))
  end
end
