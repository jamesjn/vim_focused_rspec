#!/usr/bin/env ruby

class VimFocusedRspec
  def self.output_and_run(cmd)
    puts cmd
    system cmd
  end

  def self.select_cmd_and_run
    filename = ARGV[0]
    line_num = ARGV[1].to_i
    lines_of_file = File.read(filename).split(/\n/)
    #read lines from current location up
    (line_num - 1).downto(0) do |i|
      if lines_of_file[i] =~ /it ["'](.*)["'] do/
        cmd = %{rspec #{filename} -e "#{$1}"}
        output_and_run(cmd)
      end
    end
  end
end

VimFocusedRspec.select_cmd_and_run
