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
    if @status == "pending"
      if !self.valid? || @sender.balance < amount
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      else
        @sender.deposit(-amount)
        @receiver.deposit(amount)
        @status = "complete"
      end
    end
  end
  
  def reverse_transfer
    if @status = "complete"
      @receiver.deposit(-amount)
      @sender.deposit(amount)
      @status = "reversed"
    end
  end
end
