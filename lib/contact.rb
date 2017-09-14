module Create
  class Contact
    attr_reader :first, :last
    def initialize(first, last)
      @first = first
      @last = last
    end

    def name()
      first + ' ' + last
    end
  end
end
