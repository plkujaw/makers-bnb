require 'space'

describe Space do

  let(:space) { Space.new }

  describe '.create' do
    it "exists" do
      expect(described_class).to respond_to(:create)
    end
  end

end
