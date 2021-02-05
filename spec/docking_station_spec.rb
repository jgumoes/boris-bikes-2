require 'docking_station'

describe DockingStation do
subject(:docking_station) {described_class.new}

  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to :dock_bike}

  it "bike working?" do
    #expect(docking_station.release_bike).to be_instance_of(Bike)
    expect(docking_station.release_bike).to be_working
  end
  
  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  it 'docks something' do
    bike  = Bike.new
    expect(subject.dock_bike(bike)).to eq bike
  end

  describe "release_bike" do

    it "raises error when there are no bikes" do
      subject.instance_variable_set(:@bike, false)
      expect { subject.release_bike }.to raise_error(NoBikeException)
    end

    it "release a bike when there is a bike" do
      subject.instance_variable_set(:@bike, Bike.new)
      expect(subject.release_bike).to be_instance_of(Bike)
    end
  end
end
