class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count >= num_buckets
      resize!
    end
    if !self.include?(key.hash)
      i = key.hash % num_buckets
      @store[i].push(key)
      @count += 1
    end
  end

  def remove(key)
    if self.include?(key)
      self[key].pop
      @count -= 1
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = Array.new(num_buckets) {Array.new}
    @store += new_arr
  end
end
