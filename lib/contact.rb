class Contact
  attr_reader(:first_name, :last_name, :number, :addresses)
  @@book = []
  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @number = attributes.fetch(:number)
    @addresses = []
  end

  def add_address(address)
    @addresses.push(address)
  end

  def save()
    @@book.push(self)
  end

  def self.find(lastName)
    @@book.each do |contact|
      if contact.last_name == lastName
        return contact
      end
    end
  end

  def self.sort()
    @@book.sort_by {|x| x.last_name}
  end
end
