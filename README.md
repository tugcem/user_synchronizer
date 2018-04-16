# User Synchronizer

Ruby app which synchronises users with intercom

## Install dependencies

`bundle`

## Install and start redis

`brew install redis`
`brew services start redis`

<!-- ## Run Sidekiq

`bundle exec sidekiq -r ./app.rb`

## Run the app

`bundle exec rackup` -->

## Place your intercom access token in environment variables

`export INTERCOM_ACCESS_TOKEN="#{INTERCOM_ACCESS_TOKEN}"`

## Run the app

`foreman start`
