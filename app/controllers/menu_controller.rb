class MenuController < ApplicationController
  def index
    @roles = Role.all
    @skills = Skill.all
    @places = Place.all
  end

  def company
  end

  def privacy
  end

  def security
  end

end
