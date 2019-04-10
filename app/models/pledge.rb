class Pledge

  attr_reader :amount, :user, :project

  @@all = []

  def initialize(project, user, amount)
    @project = project
    @user = user
    @amount = amount
    @@all << self
  end

  # Class methods

  def self.all
    @@all
  end

end