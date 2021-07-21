require 'rspec'
require './lib/character'

describe Character do
  context 'Attributes' do
    before(:each) do
      @kitt = Character.new({
        name: "KITT",
        actor: "William Daniels",
        salary: 1_000_000
        })
    end

    it 'exists' do
      expect(@kitt).to be_a(Character)
    end

    it 'has a name' do
      expect(@kitt.name).to eq("KITT")
    end

    it 'has an actor' do
      expect(@kitt.actor).to eq("William Daniels")
    end

    it 'has a salary' do
      expect(@kitt.salary).to eq(1000000)
    end
  end
end