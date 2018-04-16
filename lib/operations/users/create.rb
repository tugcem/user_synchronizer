require './lib/initializers/intercom'

module Users
  class Create

    HELPER = 'Helper'
    MEMBER = 'Member'

    attr_reader :intercom
    attr_reader :user_id
    attr_reader :name
    attr_reader :email
    attr_reader :helper
    attr_reader :memberships
    attr_reader :helper_exists
    attr_reader :memberships_exists

    def initialize(user)
      @intercom = $intercom
      @user_id            = user['user_id']
      @name               = user['name']
      @email              = user['email']
      @helper             = user['helper']
      @memberships        = user['memberships']
      @helper_exists      = user.key?('helper')
      @memberships_exists = user.key?('memberships')
    end

    def save
      user_in_intercom
      tag_helper_info_in_intercom if helper_exists
      tag_membership_info_in_intercom if memberships_exists
    end

    def user_in_intercom
      @user ||= intercom.users.create(user_id: user_id, email: email, name: name)
    end

    def tag_helper_info_in_intercom
      if helper.nil?
        clear_communities(HELPER)
      else
        update_communities(HELPER, helper['communities'])
      end
    end

    def tag_membership_info_in_intercom
      if memberships.empty?
        clear_communities(MEMBER)
      else
        update_communities(MEMBER, memberships)
      end
    end

    def clear_communities(for_user_type)
      user_in_intercom.tags.each do |tag|
        untag_user_in_intercom tag.name if tag.name.include?(for_user_type)
      end
    end

    def update_communities(for_user_type, communities)
      communities.each do |community|
        tag_user_in_intercom "#{for_user_type} in #{community['name']}"
      end
    end

    def tag_user_in_intercom tag_name
      intercom.tags.tag(name: tag_name, users: [{email: email}])
    end

    def untag_user_in_intercom tag_name
      intercom.tags.untag(name: tag_name, users: [{email: email}])
    end
  end
end
