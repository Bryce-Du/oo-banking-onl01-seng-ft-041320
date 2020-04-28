class Transfer
  attr_accessor :sender, :to, :amount
  
  def initialize (sender, to, amount)
    @sender = sender
    @to = to 
    @amount = amount
  end
end
