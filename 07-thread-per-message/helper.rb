class Helper
  def handle(count, char)
    output "        handle(#{count}, #{char}) BEGIN\n"

    count.times do
      slowly
      output char
    end
    output "\n"

    output "        handle(#{count}, #{char}) END\n"
  end

  private

  def output(message)
    $stderr.print(message)
    $stderr.flush
  end

  def slowly
    sleep 0.1
  end
end
