class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    message = ""
    if @status == "pending"
      if self.valid?
        @status = "rejected"
        message = "Transaction rejected. Please check your account balance."
      else
        @sender.deposit(-amount)
        @receiver.deposit(amount)
        @status = "complete"
      end
    end
    message
  end
end
