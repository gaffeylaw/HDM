class Dip::ThreadPool

  class Job < Struct.new(:args, :block);
  end

  def initialize(min, max = nil)
    @min = min
    @max = max || min

    @cv = ConditionVariable.new
    @mutex = Mutex.new
    @mutex1 = Mutex.new

    @queue = []
    @workers = []

    @spawned = 0
    @waiting = 0
    @shutdown = false
    @queue_locked = false

    @mutex.synchronize do
      min.times { spawn_thread }
    end
  end

  def execute(*args, &block)
    @mutex.synchronize do
      raise "Thread pool is about to shutdown" if @shutdown || @queue_locked

      @queue << Job.new(args, block)

      spawn_thread if @waiting == 0 && @spawned < @max

      @cv.signal
    end
  end

  alias :<< :execute

  def shutdown
    @mutex.synchronize do
      @shutdown = true
      @cv.broadcast
    end

    @workers.first.join until @workers.empty?
  end

  def join
    @mutex.synchronize do
      @queue_locked = true
      @cv.broadcast
      sleep 0.01 until @queue.empty?
    end
    shutdown
  end

  protected

  def spawn_thread
    thread = Thread.new do
      continue = true

      while continue do
        job = nil
        @mutex1.synchronize do
          while @queue.empty? && continue
            if @shutdown || @queue_locked
              continue = false
              break
            end

            @waiting += 1
            @cv.wait @mutex1
            @waiting -= 1

            if @shutdown || @queue_locked
              continue = false
              break
            end
          end

          if continue
            job = @queue.shift
          end
        end
        job.block.call(*job.args) if job
      end

      @mutex.synchronize do
        @spawned -= 1
        @workers.delete thread
      end
    end
    @spawned+=1
    @workers << thread
    thread
  end
end