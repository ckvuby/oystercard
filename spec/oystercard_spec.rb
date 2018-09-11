require 'oystercard'

describe Oystercard do

  # In order to use public transport
  # As a customer
  # I want money on my card

  it 'responds to balance' do
    expect(subject).to respond_to :balance
  end

  it 'expect oystercard to have default starting value of "0"' do
    expect(subject.balance).to eq(0)
  end

  # In order to keep using public transport
  # As a customer
  # I want to add money to my card

  describe '#add_money' do

    it 'tops up the card' do
      expect(subject.add_money(30)).to eq(subject.balance)
    end

    it 'tops up the card2' do
      expect{subject.add_money(30)}.to change{subject.balance}.from(0).to(30)
    end



  # In order to protect my money from theft or loss
  # As a customer
  # I want a maximum limit (of £90) on my card

    it 'expect error to be raised if top_up amount takes "balance" over 90' do
      maximum_balance = Oystercard::MAXIMUM_VALUE
      subject.add_money(maximum_balance)
      expect{subject.add_money(1)}.to raise_error("Maximum balance of #{maximum_balance} exceeded")
    end
  end

  # In order to pay for my journey
  # As a customer
  # I need my fare deducted from my card

    it { is_expected.to respond_to(:deduct_money).with(1).argument }

    it 'deducts money from card' do
      subject.add_money(30)
      expect{subject.deduct_money(9)}.to change {subject.balance}.by -9
      # expect{subject.deduct_money(9)}.to change{subject.balance}.from(30).to(21)
    end

  # In order to get through the barriers
  # As a customer
  # I need to touch in and out

  describe "#touch_in" do
    
    it { is_expected.to respond_to(:touch_in)}

    it 'expects the status of cards that are touched in to be true' do
      subject.touch_in
      expect(subject.status).to be(true)
    end

    
  end
  
  describe "#touch_out" do
    
    it { is_expected.to respond_to(:touch_out)}

    it 'expects the status of cards that are touched out to be false' do
      subject.touch_in
      subject.touch_out
      expect(subject.status).to be(false) 
    end
    
  end
  
  describe "#in_journey" do
    
    it { is_expected.to respond_to(:in_journey?)}

    it 'shows us if a card is in use' do
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end
    
  end

end
