require 'csv'

module ActiveCSV
  class Base
    class << self
      attr_accessor :file_path
    end

    def initialize(row=nil)
      @row = row
    end

    def method_missing(method_name)
      @row.each do |key, value|
        if method_name.to_s == key
          return value
        else
          nil
        end
      end
      super
    end

    def respond_to_missing?(method, *)
      @row.each do |key, value|
        if method.to_s == key
          true
        end
      end
      super
    end

    def self.file_path=(file_path)
      @file_path = file_path
    end

    def self.file_path
      @file_path
    end
  end
end