module Async
  class WaitGroup
    def initialize
      @count = 0
      @channel = Channel(Nil).new
      @mutex = Mutex.new
    end

    def add(n = 1)
      @mutex.synchronize do
        @count += 1
      end
    end

    def done
      @mutex.synchronize do
        @count -= 1
        @channel.send nil if @count == 0
      end
    end

    def wait
      @channel.receive
      nil
    end
  end
end
