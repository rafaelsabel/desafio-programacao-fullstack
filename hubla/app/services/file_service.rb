# frozen_string_literal: true

class FileService
  attr_accessor :current_user, :files

  def initialize(current_user, files)
    self.current_user = current_user
    self.files = files
  end

  def parse
    files.each do |file|
      transactions = file.read.split("\n")

      Transaction.transaction do
        transactions.each do |transaction|
          Transaction.create!({
            user: User.find_by(name: transaction[66..85].strip),
            product: Product.find_by(name: transaction[26..55].strip),
            type: transaction[0].to_i,
            date: transaction[1..25],
            amount: transaction[56..65].to_i / 100,
          })
        end

        current_user.files.attach(file)
      end
    end
  rescue => e
    raise 'Invalid file'
  end
end
