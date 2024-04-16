class Question
  attr_reader :first_number, :second_number

  def initialize
    @first_number = Random.rand(1...20)
    @second_number = Random.rand(1...20)
  end

  def is_correct(answer)
    answer == self.first_number + self.second_number
  end
end