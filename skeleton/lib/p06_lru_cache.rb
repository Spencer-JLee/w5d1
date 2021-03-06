require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      @store.update(key, @max)
    else
      val = @prc.call(key)
      @store.append(key, val)
      node = @store.get(key)
      @map.set(key, node)
      if count > @max
        eject!
      end
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
  end

  def eject!
    key = @store.first.key
    @store.remove(key)
    @map.delete(key)
  end
end
