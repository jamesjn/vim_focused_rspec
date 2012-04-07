require 'rspec'
require './bin/vim_focused_rspec'
 
describe VimFocusedRspec do

  it 'should output and run cmd' do
    cmd = 'test command'
    VimFocusedRspec.should_receive(:puts).with(cmd)
    VimFocusedRspec.should_receive(:system).with(cmd)
    VimFocusedRspec.output_and_run(cmd)
  end

  it 'should select the correct commmand to run' do
    File.should_receive(:read).with('testfile.rb').and_return('first line\nit "should select lala" do') 
    VimFocusedRspec.should_receive(:output_and_run).with("rspec testfile.rb -e \"should select lala\"")
    ARGV = %w{testfile.rb 2}
    VimFocusedRspec.select_cmd_and_run
  end
end
