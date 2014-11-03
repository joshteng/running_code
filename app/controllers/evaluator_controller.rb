require 'tempfile'

class EvaluatorController < ApplicationController
  def new
  end

  def create

    test =
    'describe "apple" do
      it "should return true" do
        expect(apple).to eq(true)
      end
    end

    describe "pear" do
      it "should return \'I love pears\'" do
        expect(pear).to eq(\'I love pears\')
      end
    end
    '

    file = Tempfile.new('code_division_evaluator.rb')
    # file.path
    file.write(params[:evaluator][:code] + "\n\n" + test)
    # file.rewind
    # puts file.read      # => "hello world"
    file.close
    puts '------>'
    puts File.open(file.path, 'r').read

    error_log_file = Tempfile.new('errors.log')
    output_log_file = Tempfile.new('output.log')

    RSpec.reset
    a = RSpec::Core::Runner.run([file.path, "--color", "--format", "documentation", "--out", output_log_file.path], error_log_file)

    output_log_file.close

    test_output = TestOutput.new

    ANSI2HTML::Main.new(File.read(output_log_file.path), test_output)

    @output = error_log_file.read + "\n\n----\n\n" + test_output.read

    # error_log_file.close
    output_log_file.unlink
    error_log_file.unlink
    file.unlink    # deletes the temp file
  end
end
