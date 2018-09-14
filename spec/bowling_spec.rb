require 'bowling'

RSpec.describe Bowling do
  subject { described_class.new }

  context "with no strike or spare" do
    it "scores 0 for gutter game" do
      20.times { subject.hit(0) }

      expect(subject.score).to eq 0
    end

    it "scores 20 for 20 rolls hitting 1 pin" do
      20.times { subject.hit(1) }

      expect(subject.score).to eq 20
    end

    it "scores 90 for 20 rolls hitting 9 pins" do
      10.times {
        subject.hit(5)
        subject.hit(4)
      }

      expect(subject.score).to eq 90
    end
  end

  context "with spares" do
    it "scores 20 for a spare followed by 5 pins hit" do
      subject.hit(9)
      subject.hit(1)
      subject.hit(5)
      17.times { subject.hit(0) }

      expect(subject.score).to eq 20
    end

    it "scores 40 for 3 spares followed by gutters" do
      3.times {
        subject.hit(5)
        subject.hit(5)
      }
      14.times { subject.hit(0) }

      expect(subject.score).to eq 40
    end

    it "scores 25 for 9 pins knocked in first 2 rolls followed by spare then 3" do
      subject.hit(5)
      subject.hit(4)
      subject.hit(5)
      subject.hit(5)
      subject.hit(3)
      15.times { subject.hit(0) }

      expect(subject.score).to eq 25
    end

    it "scores 150 for 10 spares followed by 5 pins hit" do
      21.times { subject.hit(5) }

      expect(subject.score).to eq 150
    end

    it "scores 155 for 10 spares followed by 10 pins hit" do
      20.times { subject.hit(5) }
      subject.hit(10)

      expect(subject.score).to eq 155
    end
  end

  context "with strikes" do
    it "scores 22 for a strike followed by 2 rolls hitting 1 pin" do
      subject.hit 10
      2.times { subject.hit 1 }
      16.times { subject.hit 0 }

      expect(subject.score).to eq 14
    end

    it "scores 300 for 12 strikes" do
      12.times { subject.hit 10 }

      expect(subject.score).to eq 300
    end

    it "scores 16 for 2 rolls hitting 1 pin then a strike followed by 2 rolls hitting 1 pin" do
      2.times { subject.hit 1 }
      subject.hit 10
      2.times { subject.hit 1 }
      14.times { subject.hit 0 }

      expect(subject.score).to eq 16
    end
  end
end
