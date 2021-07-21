class Network
  attr_reader :name, :shows

  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show)
    @shows << show
  end

  def main_characters
    all_characters = @shows.flat_map do |show|
      show.characters
    end
    
    all_characters.select do |character|
      character.salary > 500000 && character.name == character.name.upcase
    end
  end

  def actors_by_show
    show_and_cast = Hash.new

    @shows.each do |show|
      show_and_cast[show] = []

      show.characters.each do |character|
        show_and_cast[show] << character.actor
      end
    end
    show_and_cast
  end

  def shows_by_actor
    actor_in_shows = Hash.new

    all_characters = @shows.flat_map do |show|
      show.characters
    end

    actors = all_characters.map do |character|
      character.actor
    end.uniq

    actors.each do |actor|
      actor_in_shows[actor] = []
    end

    @shows.each do |show|
      show.characters.each do |character|
        actor_in_shows.each_key do |actor|
          actor_in_shows[actor] << show if character.actor == actor
        end
      end
    end
    actor_in_shows
  end

  def prolific_actors
    shows_by_actor.filter_map do |key, value|
      key if value.length > 1
    end
  end
end