require 'oystercard'

describe Oystercard do
  subject(:oyster) { described_class.new }

  # In order to use public transport
  # As a customer
  # I want money on my card


  it 'expect oystercard to have default starting value of "0"' do
    expect(oyster.balance).to eq(0)
  end

  # In order to keep using public transport
  # As a customer
  # I want to add money to my card

  describe '#add_money' do

    it 'tops up the card, testing for the returned balance value' do
      expect(oyster.add_money(30)).to eq(oyster.balance)
    end

    it 'tops up the card amends card balance by top up amount' do
      amount = rand(1..50)
      expect{oyster.add_money(amount)}.to change{oyster.balance}.by(amount)
    end

  # In order to protect my money from theft or loss
  # As a customer
  # I want a maximum limit (of £90) on my card

    it 'expect error to be raised if top_up amount takes "balance" over 90' do
      maximum_balance = Oystercard::MAXIMUM_VALUE
      oyster.add_money(maximum_balance)
      expect{oyster.add_money(1)}.to raise_error("Maximum balance of #{maximum_balance} exceeded")
    end
  end
  
  # In order to get through the barriers
  # As a customer
  # I need to touch in and out
  describe '#touch_out' do

    it 'raises an error when card balance is below minimum value' do
      expect {oyster.touch_in}.to raise_error('Cannot touch in: balance below minimum')
    end
 
  end

  context 'if card is topped up above minimum value' do
    before :each do
      oyster.add_money(Oystercard::MAXIMUM_VALUE)
    end
  
      describe "#touch_in" do
      
      it 'expects the status of cards that are touched in to be true' do
        oyster.touch_in
        expect(oyster.status).to be(true)
      end

      it 'stores the station where the card is touched in' do
        oyster.touch_in(station)
        expect(oyster.station).to eq(station)
      end

      # In order to pay for my journey
      # As a customer
      # I need my fare deducted from my car
      
    end
    
    describe "#touch_out" do

      it 'expects the status of cards that are touched out to be false' do
        oyster.touch_in
        oyster.touch_out
        expect(oyster.status).to be(false) 
      end

      context 'on completion of journey' do
        it 'deducts the minimum fare from oyster balance' do
          expect{oyster.touch_out}.to change{oyster.balance}.by -Oystercard::MINIMUM_VALUE 
        end
      end

    end

    describe "#in_journey" do

      it 'shows us if a card is in use when it has been touched in' do
        oyster.touch_in
        expect(oyster.in_journey?).to eq true
      end
      it 'shows us that a card is not in use when it has been touched out' do
        oyster.touch_out
        expect(oyster).not_to be_in_journey
      end
      
    end

  end

end
