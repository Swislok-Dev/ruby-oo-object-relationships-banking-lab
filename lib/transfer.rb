
class Transfer
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    return true if @sender.valid? == true && @receiver.valid? == true
    false
  end

  def execute_transaction
    if !self.valid? || @sender.balance < self.amount
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif self.status == "pending"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      return
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    else
      return
    end
  end

  
end
