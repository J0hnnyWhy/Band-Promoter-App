require("bundler/setup")
Bundler.require(:default)
require('pry')


Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

get('/band/:id') do
  @band = Band.find(params.fetch('id'))
  @venues = Venue.all()
  @bands = Band.all()
  erb(:band)
end

post('/band_add/') do
  @name = params.fetch('name')
  @band = Band.create({:name => @name})
  @venues = Venue.all()
  @bands = Band.all()
  erb(:index)
end

patch('/band/:id') do
  date = params.fetch('update')
  @band = Band.find(params.fetch('id'))
  @band.update({:name => date})
  @bands = Band.all()
  erb(:band)
end

delete('/band/:id') do
  @band = Band.find(params.fetch('id'))
  @band.delete()
  @bands = Band.all()
  @venues = Venue.all()
  erb(:index)
end

post('/band_venue_add/') do
  venue_name = params.fetch('venue_add')
  new_venue = Venue.create({:venue_name => venue_name})
  # venue = Venue.find_by({:venue_name => new_venue})
  band_id = params.fetch('band_id')
  band = Band.find(band_id)
  band.venues.push(new_venue)
  @band = band
  erb(:band)
end

get('/venue/:id') do
  @venue = Venue.find(params.fetch('id'))
  @bands = Band.all()
  @venues = Venue.all()
  erb(:venue)
end

post('/venue_add/') do
  @venue_name = params.fetch('venue_name')
  @venue = Venue.create({:venue_name => @venue_name})
  @venues = Venue.all()
  @bands = Band.all()
  erb(:index)
end

delete('/venue/:id') do
  @venue = Venue.find(params.fetch('id'))
  @venue.delete()
  @venues = Venue.all()
  @bands = Band.all()
  erb(:index)
end
