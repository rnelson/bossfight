class AdminController < ApplicationController
  before_action :user_is_admin

  def index
  end

  def bosses
    @users = User.all
    @employees = Hash.new

    @users.each do |user|
      @employees[user.id.to_s] = Boss.employees_for(user.id)
    end
  end

  def projects
    @projects = Project.all
  end

  def set_employees
    boss = User.find_by_id(params[:boss_id])

    respond_to do |format|
      if boss and Boss.set_employees(boss.id, params[:employees])
        format.html { redirect_to action: 'bosses' }
      else
        format.html { redirect_to action: 'bosses' }
      end
    end
  end

end
