
class Project

  attr_reader :name, :creator, :goal

  @@all = []

  def initialize(name, creator, goal)
    @name = name
    @creator = creator
    @goal = goal
    @@all << self
  end

  def pledges
    Pledge.all.select { |pledge| pledge.project == self}
  end

  #get all backers
  def backers
    pledges.map { |pledge| pledge.user }
  end

  # get total amount of money donated to the project.
  def amount_donated
    pledges.inject(0) do |sum, pledge|
      sum + pledge.amount
    end
  end


  # Class methods

  def self.all
    @@all
  end

  def self.get_project_by_name(name)
    self.all.find { |project| project.name == name }
  end

  # Find all projects with no pledges
  def self.no_pledges
    all.select { |project| project.pledges.empty? }
  end

  #find all projects that have met or exceeded their pledge goal
  def self.above_goal
    all.select { |project| project.amount_donated > project.goal }
  end

  #find the project with the most users backing it
  def self.most_backers
    all.max_by { |project| project.backers.length }
  end
end