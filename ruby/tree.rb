#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
class Tree
  attr_accessor :children, :node_name
  
  def initialize(hash={},nodename='root')
    @node_name = nodename
    @children = []
    hash.each {|key, value| 

      
      @children.push(Tree.new(value,key))
    }
    puts @children
  end
  

  def visit_all(&block)
    puts children.class

    visit &block
    children.each {|c| c.visit_all &block}
  end
  
  def visit(&block)
    block.call self
  end
end

hash = {
  'grandpa' => { 
    'dad' => {
      'child 1' => {}, 
      'child 2' => {} 
    }, 
    'uncle' => {
      'child 3' => {},
      'child 4' => {} 
    } 
  } 
}

ruby_tree = Tree.new({'hash'=>hash})

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
