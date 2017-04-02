# Stub the Monzo client gem https://github.com/monzo/mondo-ruby
class FakeMonzo
  def call(_env)
    [200, {}, [File.read('test/transactions.json')]]
  end
end
