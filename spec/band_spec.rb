require('spec_helper')

describe(Band) do
  it { should have_and_belong_to_many(:venues)}
end

describe(Band) do
  it("converts the band name to uppercase") do
    band = Band.create({:name => "hamster mutiny"})
    expect(band.name).to(eq("Hamster mutiny"))
  end

  it("doesn't crate an entry if input is empty") do
    band = Band.create({:name => ""})
    expect(Band.all).to(eq([]))
  end
end
