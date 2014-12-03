#Not Tested - Work in Progress

## OmniAuth Yahoo OAuth2 Strategy

Strategy to authenticate with Yahoo via OAuth2 in OmniAuth.

 Consumer Key and Consumer Secret key at: https://developer.apps.yahoo.com/projects 

**Note**: You must enable the "Contacts API" and "Social Directory (Profile) API". Otherwise, you will receive an `OAuth2::Error` stating that access is not configured when you attempt to authenticate.

For more details, read the Google docs: https://developer.yahoo.com/oauth2/guide/

## Installation

Add to your `Gemfile`:

```ruby
gem "omniauth-yahoo2"
```

Then `bundle install`.

## Yahoo API Setup


## Usage

Here's an example for adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :yahoo, ENV["CONSUMER_KEY"], ENV["SECRET_KEY"]
end
```

You can now access the OmniAuth Google OAuth2 URL: `/auth/yahoo`


## Configuration

