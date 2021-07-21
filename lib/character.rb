class Character
  attr_reader :name, :actor, :salary

  def initialize(params)
    @name = params[:name]
    @actor = params[:actor]
    @salary = params[:salary]
  end
end