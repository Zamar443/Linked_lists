class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      tail.next_node = Node.new(value)
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    count = 0
    current = @head
    while current
      count += 1
      current = current.next_node
    end
    count
  end

  def head
    @head
  end

  def tail
    return nil if @head.nil?
    current = @head
    current = current.next_node while current.next_node
    current
  end

  def at(index)
    current = @head
    count = 0
    while current
      return current if count == index
      count += 1
      current = current.next_node
    end
    nil
  end

  def pop
    return nil if @head.nil?
    return @head = nil if @head.next_node.nil?

    current = @head
    current = current.next_node while current.next_node.next_node
    current.next_node = nil
  end

  def contains?(value)
    current = @head
    while current
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  def find(value)
    current = @head
    index = 0
    while current
      return index if current.value == value
      index += 1
      current = current.next_node
    end
    nil
  end

  def to_s
    current = @head
    result = ""
    while current
      result += "( #{current.value} ) -> "
      current = current.next_node
    end
    result + "nil"
  end

  def insert_at(value, index)
    return prepend(value) if index == 0
    prev = at(index - 1)
    return if prev.nil?
    prev.next_node = Node.new(value, prev.next_node)
  end

  def remove_at(index)
    return @head = @head.next_node if index == 0 && @head
    prev = at(index - 1)
    return if prev.nil? || prev.next_node.nil?
    prev.next_node = prev.next_node.next_node
  end
end
