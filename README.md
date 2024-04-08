# Payassist

Ruby client for https://developer.payassist.io/ru/p2p

## Installation

bundle install payassist

## Usage

```ruby

    Payassist.configure do |config|
      config.base_url = "https://api.payassist.io/p2p"
      config.client_id = "<YOUR CLIENT ID>"
      config.client_secret = "<YOUR CLIENT SECRET>"
    end

    # To get balance
    balance_data = Payassist::Balance.new.get({
        "provider" => ["CARD"],
        "currency" => ["RUB"]
    })['responseData']['accounts']

    # Deposit money on account
    bill_payment_data = Payassist::BillPayment.new.create_host2host(request_data)['responseData']

    # To proceed withdrawal
    transfer_data = Payassist::Transfer.new.p2card(request_data)['responseData']

    # To check transactions
    transactions_data = Payassist::Transaction.new.list(request_data)['responseData']

    # To list SBP banks
    banks_data = Payassist::Bank.new.all['responseData']

```
**See more data in tests!**

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/payassist. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/payassist/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Payassist project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/payassist/blob/main/CODE_OF_CONDUCT.md).
