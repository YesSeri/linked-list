class LinkedList
  def initialize
    @head = nil
  end
  def append(value)
    if !@head
      @head = Node.new(value, nil)
    else
       tail =  Node.new(value, nil)
       node = tail()
       node.next_node = tail
    end
  end 
  def prepend(value)
    if !@head
      @head = Node.new(value, nil)
    else
      node = Node.new(value, @head)
      @head = node
    end
  end 
  def size()
    i = 1
    node = @head
    while node.next_node
      i += 1
      node = node.next_node
    end
    i
  end 
  def head()
    @head
  end
  def tail()
    tail = @head
    while tail.next_node != nil
      tail = tail.next_node
    end
    tail
  end
  def at(index)
    node = @head
    for i in 0...index
      return nil if node.next_node == nil
      node = node.next_node
    end
    node
  end
  def pop
    node = @head
    deleted = false
    return nil if !node

    while deleted == false 
      if node.next_node.next_node == nil
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
  if index == 0
    prepend(value)
  elsif index == size-1
    append(value)
  else
    node_after = at(index)
    node_before = at(index-1)
    node = Node.new(value, node_after)
    node_before.next_node = node
    puts "before #{node_before.value} current #{node.value} after #{node_after.value} "
  end
end
  def remove_at(index)
    if index == 0
      @head = @head.next_node 
      return nil
    end
    at(index-1).next_node = at(index+1)
  end
  def to_s
    node = @head
    while node
      print "( #{node.value} ) -> "
      node = node.next_node
    end
    print "nil"
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
list.append("H")
list.append("E")
list.append("A")
list.append("P")
list.to_s
