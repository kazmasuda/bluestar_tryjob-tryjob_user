class ProjectsController < ApplicationController  
  helper_method :sort_column, :sort_direction
  def index    
    @projects = Project.order("updated_at DESC")
  end

  def search_role
    @projects = Project.where(role: params[:search_id]).order(sort_column + ' ' + sort_direction)
    @search = Role.find(params[:search_id])
    @link = 'role'
    render :action => "index"
  end

  def search_place
    @projects = Project.where(place: params[:search_id]).order(sort_column + ' ' + sort_direction)
    @search = Place.find(params[:search_id])
    @link = 'place'
    render :action => "index"
  end

  def search_skill
    environments = Environment.where(skill: params[:search_id]).select("project_id").group("project_id")
    skills = Array.new
    environments.each do |environment|
      skills << environment.project
    end

    @projects = Project.where(id: skills).order(sort_column + ' ' + sort_direction)
    @search = Skill.find(params[:search_id])
    @link = 'skill'
    render :action => "index"
  end

  def role_show
    @role = Role.find(params[:search_id])
    @search_name = @role.name
    @link = 'role'

    show
  end

  def place_show
    @place = Place.find(params[:search_id])
    @search_name = @place.name
    @link = 'place'

    show
  end

  def skill_show
    @skill = Skill.find(params[:search_id])
    @search_name = @skill.name
    @link = 'skill'

    show
  end

  private

    def show
      @project = Project.find(params[:id])
      @search_id = params[:search_id]

      @apply = Apply.new
      @apply.project_id = @project.id
      @store = Store.new
      @apply.avatar = Store.new

      render :action => 'show'
    end
    
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
  end
 
  def sort_column
    Project.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end
end
