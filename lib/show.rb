class Show
  attr_reader :name, :creator, :characters

  def initialize(name, creator, characters)
    @name = name
    @creator = creator
    @characters = characters
  end

  def total_salary
    all_salary = 0

    @characters.each { |character| all_salary += character.salary }

    all_salary
  end

  def highest_paid_actor
    character_played_by = @characters.max_by { |character| character.salary }
    character_played_by.actor
  end

  def actors
    @characters.map { |character| character.actor }
  end
end
