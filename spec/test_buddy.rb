require 'rspec/expectations'

def run_rotr_with_input(*inputs)
  shell_output = ""
  IO.popen('./main.rb', 'r+') do |pipe|
    inputs.each do |input|
      pipe.puts input
    end
    pipe.close_write
    shell_output << pipe.read
  end
  shell_output
end

