class Transfer
  attr_accessor :amount, :status
  attr_reader :sender, :receiver
  
  def initialize(sender, receiver, amount = 50, status = 'pending')
    
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
    
  end
  
  def valid?
    
    sender.valid?
    receiver.valid?
    
  end
  
  def execute_transaction
    
    if @status == 'pending' && self.valid? && sender.balance >= amount
      sender.balance -= amount
      receiver.balance += amount
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
    
  end
  
  def reverse_transfer
    
    if @status == 'complete'
      sender.balance += amount
      receiver.balance -= amount
      @status = 'reversed'
    else
      "Transfer cannot be reversed"
    end
    
  end
  
end
