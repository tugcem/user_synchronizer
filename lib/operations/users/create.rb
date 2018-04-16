require './lib/initializers/intercom'

module Users
  class Create
    attr_reader :intercom
    attr_reader :user_id
    attr_reader :name
    attr_reader :email

    def initialize(user)
      @intercom = $intercom
      @user_id  = user['user_id']
      @name     = user['name']
      @email    = user['email']
    end

    def save
      user_in_intercom
    end

    def user_in_intercom
      @user ||= intercom.users.create(user_id: user_id, email: email, name: name)
    end
  end
end
