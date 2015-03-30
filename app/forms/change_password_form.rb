class ChangePasswordForm
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  # Add all validations you need
  #validates_presence_of :old_password, :password, :password_confirmation
  validates_confirmation_of :password
  validate :fields_specified
  validate :verify_old_password

  attr_accessor :old_password, :password, :password_confirmation
  # attr_accessor :errors

  def initialize(user)
    @user = user
    # self.errors = [] #Array.new
    @errors = Array.new
  end

  def submit(params)
    # self.old_password = params[:old_pasword]
    # self.password = params[:password]
    # self.password_confirmation = params[:password_confirmation]
    @old_password = params[:old_pasword]
    @password = params[:password]
    @password_confirmation = params[:password_confirmation]

    if valid?
      @user.password = password
      @user.password_confirmation = password_confirmation
      @user.save!
      true
    else
      false
    end
  end

  def fields_specified
    if @old_password.nil?
      @errors << 'Must specify old password'
      return false
    end

    if @password.nil? or @password_confirmation.nil?
      @errors << 'Must specify new password'
      return false
    end

    if @password != @password_confirmation
      @errors << 'Passwords do not match'
      return false
    end

    true
  end

  def verify_old_password
    @errors << 'Incorrect old password' if @user.password != @password
    #self.errors << "Not valid" if @user.password != password
    # self.errors.push('Not valid') if @user.password != password
  end

  # This method is required
  def persisted?
    false
  end
end