require 'rails_helper'
require 'factories/transaction_factory'

RSpec.describe Transaction, type: :model do
  tx_good = makeTransaction1()

  it "saves good transaction" do
    expect(tx_good.save).to be true
  end

  describe "doesn't save bad transactions," do
    before(:all){
      tx_good.save()
    }
    tx_bad_nil = Transaction.new(txHash:nil,data:nil)

    it "doesn't save nil values" do
      expect(tx_bad_nil.save).to be_falsey

      tx_bad_nil.txHash = "something"
      expect(tx_bad_nil.save).to be_falsey

      tx_bad_nil.txHash = nil
      tx_bad_nil.data = "something"
      expect(tx_bad_nil.save).to be_falsey
    end
    it "doesn't save duplicate hash values" do
      tx_orig = makeTransaction1()
      tx_orig.save
      tx_bad_dup = makeTransaction1()
      expect(tx_bad_dup.save).to be_falsey
    end
  end

  describe "makes API calls", :aggregate_failures => true do
    pending "need to finish this one"
  end
end #end transaction spec
