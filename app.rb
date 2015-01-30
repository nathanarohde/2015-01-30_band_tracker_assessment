require('bundler/setup')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get ('/') do
  @bands = Band.all
  @venues = Venue.all

  erb(:index)
end

post ('/band_add') do
  band_name = params['band_name']
  Band.create({ :name => band_name})

  redirect ('/')
end

post ('/venue_add') do
  venue_location = params['venue_location']
  Venue.create({ :location => venue_location})

  redirect ('/')
end

get ('/band_edit/:id') do
  @band = Band.find(params['id'])
  @venues = Venue.all

  erb(:band_edit)
end
