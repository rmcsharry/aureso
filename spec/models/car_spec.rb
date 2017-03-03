require 'rails_helper'

RSpec.describe Car, type: :model do
  subject {
    described_class.new(
    "name": "Subaru Impreza",
    "max_speed": 120,
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with non-unique name" do
    subject.save
    dup_subject = described_class.new("name": "Subaru Impreza")
    dup_subject.save
    expect(dup_subject).to_not be_valid
  end

  it "returns max_speed_on_track attribute" do
    expect(subject).to have_attributes(max_speed_on_track: nil)
  end
end
