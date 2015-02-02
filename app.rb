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

patch ('/assign_venues') do
  @band = Band.find(params['id'])
  @venues_ids = params['venues_ids']
  # if @venues_ids != nil
  #   @venues_ids.each() do |venue_id|
  #     venue = Venue.find(venue_id)
  #     @band.venues << venue
  #   end
  # end
  @band.update({ :venue_ids => @venues_ids })
  redirect('/')
end

delete ('/delete_band') do
  @band = Band.find(params['id'])
  @band.destroy()
  redirect('/')
end

patch ('/edit_band') do
  name = params['band_name']
  @band = Band.find(params['id'])
  @band.update({:name => name})
  redirect('/')
end
