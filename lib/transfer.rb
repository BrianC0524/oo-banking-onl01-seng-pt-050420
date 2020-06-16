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
    
    if @status == 'pending'
      sender.balance -= amount
      receiver.balance += amount
      @status = 'complete'
    else
      "Invalid Transaction."
    end
    
  end
  
end
