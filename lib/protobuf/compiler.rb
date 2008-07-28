# This is a quite temporary implementation.
# I'll create a compiler class using Racc.

module Protobuf
  class Compiler
    INDENT_UNIT = '  '

    def self.compile(filename)
      self.new.compile filename
    end

    def initialize
      @indent_level = 0
    end

    def indent
      INDENT_UNIT * @indent_level
    end

    def puts_with_indent(string)
      puts "#{indent}#{string}"
    end
    alias putswi puts_with_indent

    def compile(filename)
      File.open filename, 'r' do |file|
        file.each_line do |line|
          line.sub! /^(.*)\/\/.*/, '\1'
          line.strip!
          case line
          when /^package\s+(\w+(\.\w+)?)\s*;$/
            $1.split('.').each do |path|
              putswi "module #{path.capitalize}"
              @indent_level += 1
            end
          when /^message\s+(\w+)\s*\{$/
            putswi "class #{$1} < Protobuf::Message"
            @indent_level += 1
          when /^(required|optional|repeated)\s+(\w+)\s+(\w+)\s*=\s*(\d+)\s*(\[\s*default\s*=\s*(\w+)\s*\])?\s*;$/
            rule, type, name, tag, default = $1, $2, $3, $4, $6
            if default
              default = default =~ /\d+(\.\d+)/ \
                ? ", {:default => #{default}}" \
                : ", {:default => :#{default}}"
            end
            putswi "#{rule} :#{type}, :#{name}, #{tag}#{default}"
          when /^enum\s+(\w+)\s*\{$/
            putswi "class #{$1} < Protobuf::Enum"
            @indent_level += 1
          when /^(\w+)\s*=\s*(\w+)\s*;$/
            putswi "#{$1} = #{$2}"
          when /^\}$/
            @indent_level -= 1
            putswi "end"
          when ''
            puts ''
          end
        end
        while 0 < @indent_level 
          @indent_level -= 1
          putswi "end"
        end
      end
    end
  end
end