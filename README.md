# User Synchronizer
Ruby app which synchronises your users with Intercom asynchronously. It uses tags in intercom to specify user type and community info.

To start, please follow instructions below to run the app.

# Installation

- Ruby 2.5.1
- `bundle` installs rubygems dependencies
- `brew install redis` installs redis if applicable
- `brew services start redis` starts redis
- `export INTERCOM_ACCESS_TOKEN="#{INTERCOM_ACCESS_TOKEN}"` places your intercom access token in environment variable
- `foreman start` runs the app!
- `bundle exec rspec` runs the tests

# Usage

Try `/create_user` endpoint to create and update your users in intercom.

## Create and update user example request

`curl -X POST localhost:9292/create_user\
 -d '{"name":"Faker Fake","email":"faker@fake.com","user_id":"99999999","helper": {"communities": [ { "name": "South Brisbane"}, { "name": "North Brisbane"} ]},"memberships":[{"name": "Eastern Suburbs"}, {"name": "Northern Suburbs"}]}'`

## Tips when sending request

- Please provide user_id all the time.
- Set helper to `null` to remove helper tags from the user in intercom.
- Set memberships to `[]` to remove member tags from the user in intercom.
