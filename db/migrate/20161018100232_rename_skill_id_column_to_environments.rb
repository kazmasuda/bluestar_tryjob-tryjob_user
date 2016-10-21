class RenameSkillIdColumnToEnvironments < ActiveRecord::Migration
  def change
    rename_column :environments, :project, :project_id
    rename_column :environments, :skill, :skill_id
  end
end
