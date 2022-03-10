# Monzo app

Core library ([mondo](https://github.com/monzo/mondo-ruby)) hasn't been updated since 2017 - this project is basically dead.

Playing with the Monzo API.

Environment variables needed (not for test):
* `MONZO_ACCOUNT_ID`
* `MONZO_ACCESS_TOKEN`

Get these by logging into the [Monzo developer tool](https://developers.monzo.com).

```
bundle install
bundle exec rails s

bundle exec rake
```

To disable caching of API responses during development:

```
MONZOAPP_DISABLE_CACHE=true bundle exec rails s
```

Ideas:

* Spending by type by month in a doughnut chart (already in app)
* Spending by type by week in a doughnut chart
