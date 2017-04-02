# Monzo app

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

Ideas:

* Spending by type by month in a doughnut chart (already in app)
* Spending by type by week in a doughnut chart
