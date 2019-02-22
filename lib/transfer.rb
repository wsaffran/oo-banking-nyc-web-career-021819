require "pry"

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction

    if sender.balance > amount
      if status == "pending" && sender.valid? == true
        sender.balance -= @amount
        receiver.balance += @amount
        self.status = "complete"
        # binding.pry
      end
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
      self.status="reversed"
    end
  end


end
