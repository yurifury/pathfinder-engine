require "dice"

describe Dice do

  describe "d6" do
    let (:dice) { Dice.new(6) }
    subject { dice }

    it { should respond_to(:roll) }
    it { should respond_to(:roll_many) }

    describe "rolls" do
      subject { dice.roll }

      it { should be_between(1, 6) }
      it { should be_a(Integer) }

      describe "multiple rolls" do
        let (:rolls) { dice.roll_many(30) }
        subject { rolls }

        it { should be_a(Array) }
        its(:size) { should be 30 }
        it { should_not include(0, 7, 25) }

        it "should not just be one repeated value" do
          rolls.uniq.size.should be > 4
        end
      end
    end
  end

  describe "d20" do
    let (:dice) { Dice.new(20) }
    subject { dice }

    describe "rolling" do
      subject { dice.roll }
      it { should be_between(1, 20) }
    end
  end
end