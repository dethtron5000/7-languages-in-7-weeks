#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
class CsvRow
  attr_accessor :hash

  def initialize (headers, contents)
    #puts contents
    #puts headers
    @hash = {}
    internals = contents.chomp.split(',')
    headers.each_with_index do |value, key|
      #puts value
      #puts internals[key]
      hash[value] = internals[key]
    end
    #puts hash
  end

  def method_missing name, *args
    key = name.to_s
    #puts key
    #puts name
    #puts hash[key]
    return hash[key]

  end
end

module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods   
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(',')

      file.each do |row|
        @csv_contents << CsvRow.new(headers,row)
      end
    end
    
    attr_accessor :headers, :csv_contents
    def initialize
      read 
    end
  end
end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv

  def each 
    csv_contents.each do |x|
      #puts 'yes'   
      #puts x
      yield x
    end
  end

end

m = RubyCsv.new
#puts m.headers.inspect
#puts m.csv_contents.inspect
m.each {|x| puts x.two}
