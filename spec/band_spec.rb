require('spec_helper')

describe(Band) do

  it('validates presence of name') do
    ingredient = Band.new(name: '')
    expect(ingredient.save).to(eq(false))
  end

  it('validates name is 50 or fewer characters') do
    band = Band.new(name: 'b'*(51))
    expect(band.save).to(eq(false))
  end
end
