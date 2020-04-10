class LinkedList
  attr_reader :head
  def initialize
    @head = nil
  end

  def append(value)
    if !@head
      @head = Node.new(value)
    else
      old_tail = tail
      new_tail = Node.new(value)
      old_tail.next_node = new_tail
    end
  end

  def prepend(value)
    if !@head
      @head = Node.new(value)
    else
      node = Node.new(value, @head)
      @head = node
    end
  end

  def size
    i = 1
    node = @head
    while node.next_node
      i += 1
      node = node.next_node
    end
    i
  end

  def tail
    node = @head
    node = node.next_node until node.next_node.nil?
    node
  end

  def at(index)
    node = @head
    index.times { node = node.next_node }
    node
  end

  def pop
    return nil unless @head

    node = @head
    deleted = false
    while deleted == false
      if node.next_node.next_node.nil?
        node.next_node = nil
        deleted = true
      end
      node = node.next_node
    end
  end

  def contains?(value)
    node = @head
    while node
      return true if node.value == value

      node = node.next_node
    end
    false
  end

  def find(value)
    node = @head
    i = 0
    while node
      return i if node.value == value

      node = node.next_node
      i += 1
    end
    nil
  end

  def insert_at(value, index)
    if index.zero?
      prepend(value)
    elsif index == size - 1
      append(value)
    else
      node = Node.new(value, at(index))
      at(index - 1).next_node = node
    end
  end

  def remove_at(index)
    if index.zero?
      @head = @head.next_node
    else
      at(index - 1).next_node = at(index + 1)
    end
  end
  
  def to_s
    node = @head
    while node
      print "( #{node.value} ) -> "
      node = node.next_node
    end
    print "nil\n"
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
list = LinkedList.new
list.append('H')
list.append('E')
list.append('A')
list.append('P')
list.to_s
puts list.at(2).value
list.pop
list.insert_at('C', 0)
puts list.to_s
