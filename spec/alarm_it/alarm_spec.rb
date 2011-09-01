require 'spec_helper'
describe AlarmIt::Alarm do
  before(:each) do
    clean_database!
    @alarmer = Alarmer.create(:name => 'pablo')
    @alarmable = Alarmable.create(:name => 'thiz_obzect')
  end

  it { should belong_to(:alarmable) }
  it { should belong_to(:alarmer) }
  it { should validate_presence_of :alarmable_type }
  it { should validate_presence_of :alarmable_id }
  it { should validate_presence_of :set_at }
  it { should validate_presence_of :alarmer_id }
  it { should validate_presence_of :alarmer_type }

  describe "an alarm" do
    let(:alarm){AlarmIt::Alarm.create(:name => 'alarm', :alarmer => @alarmer, :alarmable => @alarmable, :set_at => 2.days.from_now)}
    specify {alarm.alarmer.should eql(@alarmer)}
    specify {alarm.alarmable.should eql(@alarmable)}
    specify {alarm.should(be_valid, alarm.errors.full_messages.to_sentence)}
    specify {alarm.should be_an_instance_of(AlarmIt::Alarm)}
    specify {alarm.should respond_to(:alarmer)}
    specify {alarm.should respond_to(:alarmable)}
    it "should be among the pending alarms" do
      AlarmIt::Alarm.pending.include?(alarm)
    end
    it "should be among the status=pending alarms" do
      AlarmIt::Alarm.status('pending').include?(alarm)
    end
    it "should be pending" do
      alarm.is_pending?.should be_true
    end
    
    it "should not be inactivated" do
      alarm.is_inactivated?.should_not be_true
    end
    
    it "should not be ringing" do
      alarm.is_ringing?.should_not be_true
    end
    
    describe "when it's inactivated" do
      before :each do
        alarm.inactivate!
      end
      
      it "should be among the inactivated alarms" do
        AlarmIt::Alarm.inactivated.include?(alarm)
      end
            
      it "should be inactivated" do
        alarm.is_inactivated?.should be_true
      end
      it "should be among the status=inactivated alarms" do
        AlarmIt::Alarm.status('inactivated').include?(alarm)
      end
    
      it "should not be pending" do
        alarm.is_pending?.should_not be_true
      end
      it "should not be among the status=pending alarms" do
        !AlarmIt::Alarm.status('pending').include?(alarm)
      end
    
      it "should not be ringing" do
        alarm.is_ringing?.should_not be_true
      end
    end
    
    describe "with set_at time in the past" do
      before :each do
        alarm.update_attributes(:set_at => 2.hours.ago)
      end
      
      it "should be among the ringing alarms" do
        AlarmIt::Alarm.ringing.include?(alarm)
      end
      
      it "should be ringing" do
        alarm.is_ringing?.should be_true
      end
    end
  end
end