require "./spec_helper"

describe Async::WaitGroup do
  it "waits for N dones" do
    wg = Async::WaitGroup.new
    n = 3
    counter = 0
    n.times do
      wg.add
      spawn do
        counter += 1
        wg.done
      end
    end
    wg.wait
    counter.should eq 3
  end
end
