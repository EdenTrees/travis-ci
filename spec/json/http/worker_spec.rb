require 'spec_helper'

describe 'Worker' do
  let(:workers) { [Factory(:worker)] }

  before(:each) do
    Time.stubs(:now).returns(Time.utc(2011, 11, 11, 11, 11, 11))
  end

  it 'json' do
    json = json_for_http(workers)
    json.should == [{
      'id' => 'ruby-1.workers.travis-ci.org:worker-1',
      'name' => 'worker-1',
      'host' => 'ruby-1.workers.travis-ci.org',
      'state' => 'working',
      'last_seen_at' => '2011-11-11T11:11:11Z'
    }]
  end
end

