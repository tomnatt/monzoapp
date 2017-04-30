# Stub the Monzo client gem https://github.com/monzo/mondo-ruby
class FakeMonzo
  def initialize(data)
    @test_data = data
  end

  def call(_env)
    [200, {}, [File.read(@test_data)]]
  end
end
