require 'order'

describe Order do
  let(:meal) { double :meal, add_dish: nil, basket: [{ name: selection, price: 2 }], sum_of_basket: 4 }
  let(:selection) { double :selection }
  subject { Order.new(meal) }

  describe '#choose', :choose do
    it 'Adds a dish to the order' do
      subject.choose(selection, 1)
      expect(subject.current_order.length).to eq(1)
    end
  end

  describe '#price', :price do
    it 'Returns the current total price of the meal' do
      2.times { subject.choose(selection, 2) }
      expect(subject.price).to eq 4
    end
  end
end