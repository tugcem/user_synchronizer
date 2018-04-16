module Users
  class Create
    attr_reader :user_id
    attr_reader :name
    attr_reader :email

    def initialize(params)
      @user_id  = params['user_id']
      @name     = params['name']
      @email    = params['email']
    end
  end
end
