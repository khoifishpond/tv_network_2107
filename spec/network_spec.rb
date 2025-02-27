require 'rspec'
require './lib/network'
require './lib/show'
require './lib/character'

describe Network do
  context 'Attributes' do
    before(:each) do
      @nbc = Network.new("NBC")
      @michael_knight = Character.new({
        name: "Michael Knight",
        actor: "David Hasselhoff",
        salary: 1_600_000
        })
      @kitt = Character.new({
        name: "KITT",
        actor: "William Daniels",
        salary: 1_000_000
        })
      @knight_rider = Show.new(
        "Knight Rider",
        "Glen Larson",
        [@michael_knight, @kitt]
        )
      @leslie_knope = Character.new({
        name: "Leslie Knope",
        actor: "Amy Poehler",
        salary: 2_000_000
        })
      @ron_swanson = Character.new({
        name: "Ron Swanson",
        actor: "Nick Offerman",
        salary: 1_400_000
        })
      @parks_and_rec = Show.new(
        "Parks and Recreation",
        "Michael Shur & Greg Daniels",
        [@leslie_knope, @ron_swanson]
        )
      @mitch = Character.new({
        name: "Mitch Buchannon",
        actor: "David Hasselhoff",
        salary: 1_200_000
      })
      @baywatch = Show.new(
        "Baywatch",
        "Gregory Bonann",
        [@mitch]
      )
    end

    it 'exists' do
      expect(@nbc).to be_a(Network)
    end

    it 'starts with no shows' do
      expect(@nbc.shows).to eq([])
    end

    it 'can add shows' do
      expect(@nbc.shows).to eq([])

      @nbc.add_show(@knight_rider)
      
      expect(@nbc.shows).to eq([@knight_rider])

      @nbc.add_show(@parks_and_rec)

      expect(@nbc.shows).to eq([@knight_rider, @parks_and_rec])
    end

    it 'can list main characters' do
      @nbc.add_show(@knight_rider)
      @nbc.add_show(@parks_and_rec)

      expect(@nbc.main_characters).to eq([@kitt])
    end

    it 'can list actors by show' do
      @nbc.add_show(@knight_rider)
      @nbc.add_show(@parks_and_rec)
      
      expect(@nbc.actors_by_show).to eq({
        @knight_rider => ["David Hasselhoff", "William Daniels"],
        @parks_and_rec => ["Amy Poehler", "Nick Offerman"]
      })
    end

    it 'can list the shows an actor has been in' do
      @nbc.add_show(@knight_rider)
      @nbc.add_show(@baywatch)
      @nbc.add_show(@parks_and_rec)

      expect(@nbc.shows_by_actor).to eq({
        "David Hasselhoff" => [@knight_rider, @baywatch],
        "William Daniels" => [@knight_rider],
        "Amy Poehler" => [@parks_and_rec],
        "Nick Offerman" => [@parks_and_rec]
      })
    end

    it 'can display prolific actors' do
      @nbc.add_show(@knight_rider)
      @nbc.add_show(@baywatch)
      @nbc.add_show(@parks_and_rec)
      
      expect(@nbc.prolific_actors).to eq(["David Hasselhoff"])
    end
  end
end