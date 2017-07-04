require 'docking_station'
describe DockingStation do
  it { is_expected.to respond_to :release_bike}

  describe '#release_bike' do
    it "doesn't give out a bike if there's none" do
      expect { subject.release_bike }.to raise_error "bike not present"
    end

    it "doesn't raise the error when we have a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike)}

  describe '#dock' do
    it 'docks a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike
    end

    it "raises an error if docking station is full and an attemp to dock is made" do
      bike1 = Bike.new
      subject.dock(bike1)
      bike2 = Bike.new
      expect { subject.dock(bike2) }.to raise_error "Docking station full"
    end
  end
end
