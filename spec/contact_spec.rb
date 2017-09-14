require('pry')
require('rspec')
require('contact')

describe('Contact') do
  test_contact1 =           Contact.new({:first_name=>'Frank',:last_name=>'Zappa',:number=>'555-186-2823'})

  test_contact2 =           Contact.new({:first_name=>'Eddie',:last_name=>'Hazel',:number=>'555-334-9696'})

  describe('#initialize') do
    it('take user input') do
      expect(test_contact1.first_name).to(eq('Frank'))
      expect(test_contact1.last_name).to(eq('Zappa'))
      expect(test_contact1.number).to(eq('555-186-2823'))
    end
  end

  describe('#add_address') do
    test_contact1.add_address('1223 23rd Ave')
    test_contact1.add_address('9876 76th Street')
    it('adds addresses') do
      expect(test_contact1.addresses[0]).to(eq('1223 23rd Ave'))
      expect(test_contact1.addresses[1]).to(eq('9876 76th Street'))
    end
  end

  describe('#save') do
    @@book = []
    test_contact1.save
    test_contact2.save
    it('saves contacts') do
      expect(@@book[0]).to(eq(test_contact1))
      expect(@@book[1]).to(eq(test_contact2))
    end
  end

  describe('.find') do
    @@book = []
    test_contact1.save
    test_contact2.save
    it('saves contacts') do
      expect(@@book.find('Hazel')).to(eq(test_contact2))
    end
  end


end
