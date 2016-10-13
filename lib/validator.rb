# it 'returns true or false if a string is a binary number' do

class Validator
  def binary(string)
    only_binary_nums = /^[01]+$/
    only_binary_nums.match(string) != nil
  end
end
