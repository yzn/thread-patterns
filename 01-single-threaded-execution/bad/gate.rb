class Gate
  def initialize
    @counter = 0
    @name = 'Nobody'
    @address = 'Nowhere'
  end

  def pass(name, address)
    @counter += 1
    sleep rand
    @name = name
    sleep rand
    @address = address

    check
  end

  def to_s
    "No. #{@counter}: #{@name}, #{@address}"
  end

  private

  def check
    if @name[0] != @address[0]
      puts "***** BROKEN ***** #{self}"
    end
  end
end
