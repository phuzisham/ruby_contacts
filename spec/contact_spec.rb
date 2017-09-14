require('pry')
require('rspec')
require('contact')

describe('Contact') do
  example = Create::Contact.new('Frank', 'Zappa')
  describe('#name') do
    it('will display contact name') do
      expect(example.name).to(eq('Frank Zappa'))
    end
  end
end
