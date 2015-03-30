class SettingsController < ApplicationController
  def index
  end

  def password
    user = User.find_by_id(session[:user_id])
    @pass_form = ChangePasswordForm.new(user)

    if @pass_form.submit(params)
      redirect_to settings_path, notice: 'Password changed'
    else
      errors  = "<div id='error_explanation'>"
      errors += "<h2>#{@pass_form.errors.count} error(s) prohibited this project from being saved:</h2>"
      errors == "<ul>"
      @pass_form.errors.each do |message|
        errors += "<li>#{message}</li>"
      end
      errors += "</ul>"
      errors += "</div>"

      redirect_to settings_path, notice: errors.html_safe
      # @errors = @pass_form.errors
      #redirect_to settings_path, errors: @errors
      # redirect_to settings_path, notice: @errors
    end
  end
end
