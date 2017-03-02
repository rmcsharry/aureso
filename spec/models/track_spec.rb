require 'rails_helper'

RSpec.describe Track, type: :model do
  describe '#surface_type' do
    let(:order) { [:asphalt, :gravel, :snow] }

    it 'has the right index' do
      order.each_with_index do |item, index|
        expect(described_class.surface_types[item]).to eq index
      end
    end
  end

  describe 'validations' do
    subject {
      described_class.new(
        "name": "Brands Hatch",
        "surface_type": "gravel",
      )
    }

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with non-unique name" do
      subject.save
      dup_subject = described_class.new("name": "Brands Hatch")
      dup_subject.save
      expect(dup_subject).to_not be_valid
    end

    it "is not valid without a surface_type" do
      subject.surface_type = nil
      expect(subject).to_not be_valid
    end
    
    # it seems the following test is impossible
    # see https://github.com/rails/rails/issues/13971
    # see http://stackoverflow.com/questions/42567600/rails-5-scaffold-and-rspec-testing-for-an-enum-in-controller-test/42568152#42568152
    # it "is not valid with a non-existent surface_type" do      
    #   subject = described_class.new("name": "Brands Hatch", "surface_type": "wood")
    #   expect(subject)
    #     .to raise_error(ArgumentError)
    #     .with_message(/is not a valid surface_type/)  
    # end
  end
end
