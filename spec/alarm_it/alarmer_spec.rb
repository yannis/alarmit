require 'spec_helper'
describe Alarmer do
  before(:each) do
    clean_database!
  end

  it { should have_many(:alarms) }

  describe "an alarmer" do
    let(:alarmer){Alarmer.create(:name => 'alarmer')}
    specify {alarmer.should respond_to(:set_alarm)}
    
    describe "that set an alarm" do
      before(:each) do
        @alarmable = Alarmable.create(:name => 'thiz_obzect')
        alarmer.set_alarm("don't forget to do it", @alarmable, 2.days.from_now)
      end
      
      specify {alarmer.should have(1).alarms}
      specify {alarmer.alarms.first.name.should eql("don't forget to do it")}
      specify {alarmer.alarms.first.alarmable.should eql(@alarmable)}
    end
  end
end