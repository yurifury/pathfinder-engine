require "dice"

describe Dice do
  describe "d6" do
    let (:dice) { Dice.new(6) }

    it "should return between 1 and 6" do
      dice.roll.should be_between(1, 6)
    end

    describe "multiple rolls" do
      let (:rolls) do
        rolls = []
        50.times { rolls << dice.roll }
        rolls
      end


      it "should return different numbers for new rolls" do
        rolls.uniq.size.should be > 2
      end

      it "should not return 0 or 7" do
        rolls.should_not include(0, 7)
      end
    end
  end
end