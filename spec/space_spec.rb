require 'space'

describe Space do

  let(:space) { Space.new }

  describe '.create' do
    it "exists" do
      expect(space).to respond_to(:create)
    end
  end

end
