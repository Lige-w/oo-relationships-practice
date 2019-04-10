class User

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def create_new_project(name, goal)
    Project.new(name,self, goal)
  end

  # pledge to a project
  def pledge(project_name, amount)
    project = Project.get_project_by_name(project_name)
    Pledge.new(project, self, amount)
  end

  def pledges
    Pledge.all.select { |pledge| pledge.user == self }
  end

  # return all projects created by self
  def projects
    Project.all.select { |project| project.creator == self }
  end
  # Class methods

  def self.all
    @@all
  end

  # Return user who has made the highest pledge
  def self.highest_pledge
    Pledge.all.max_by { |pledge| pledge.amount }.user
  end

  # return all users who have made more than one pledge
  def self.multi_pledger
    all.select { |user| user.pledges.length > 1 }
  end

  # Return all users who have created a projects
  def self.project_creator
    all.reject { |user| user.projects.empty? }.uniq
  end

end