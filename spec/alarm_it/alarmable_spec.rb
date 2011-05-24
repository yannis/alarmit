require 'spec_helper'
describe Alarmable do
  before(:each) do
    clean_database!
  end

  it { should have_many(:alarms) }
end