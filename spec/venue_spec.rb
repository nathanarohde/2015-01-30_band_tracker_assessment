require('spec_helper')

describe(Venue) do
  it { should have_and_belong_to_many(:bands)}
end

describe(Venue) do
  it("converts the venue location to uppercase") do
    venue = Venue.create({:location => "place"})
    expect(venue.location).to(eq("Place"))
  end

  it("doesn't crate an entry if input is empty") do
    venue = Venue.create({:location => ""})
    expect(Venue.all).to(eq([]))
  end
  
end
