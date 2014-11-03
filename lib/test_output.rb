class TestOutput
  def initialize(input = "")
    @log = input
  end

  def print(input)
    @log += input
  end

  def read
    @log.gsub(/[\n]/, "<br>").gsub(/(\s\s)/, "&nbsp;&nbsp;")
  end
end
