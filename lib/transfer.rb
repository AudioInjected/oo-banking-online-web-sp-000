class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid? ? true : false
  end

  def execute_transaction
    if self.status == "pending" && self.sender.valid? && self.receiver.valid? && self.sender.balance >= self.amount
        self.sender.valid? && self.receiver.valid?
        self.sender.balance -= amount
        self.receiver.balance += amount
        self.status = "complete"
      else
        "Transaction rejected. Please check your account balance."
        #self.status = "rejected"
    end
  end
end
