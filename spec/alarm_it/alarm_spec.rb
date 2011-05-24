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
  end
end

# require File.expand_path('../../spec_helper', __FILE__)
# 
# describe AlarmIt::Alarm do
#   before(:each) do
#     clean_database!
#     @alarm = AlarmIt::Alarm.new
#     @user = AlarmableModel.create(:name => "Pablo")
#   end
# 
#   describe "named like any" do
#     before(:each) do
#       AlarmIt::Alarm.create(:name => "awesome")
#       AlarmIt::Alarm.create(:name => "epic")
#     end
# 
#     it "should find both alarms" do
#       AlarmIt::Alarm.named_like_any(["awesome", "epic"]).should have(2).items
#     end
#   end
# 
#   describe "find or create by name" do
#     before(:each) do
#       @alarm.name = "awesome"
#       @alarm.save
#     end
# 
#     it "should find by name" do
#       AlarmIt::Alarm.find_or_create_with_like_by_name("awesome").should == @alarm
#     end
# 
#     it "should find by name case insensitive" do
#       AlarmIt::Alarm.find_or_create_with_like_by_name("AWESOME").should == @alarm
#     end
# 
#     it "should create by name" do
#       lambda {
#         AlarmIt::Alarm.find_or_create_with_like_by_name("epic")
#       }.should change(AlarmIt::Alarm, :count).by(1)
#     end
#   end
# 
#   describe "find or create all by any name" do
#     before(:each) do
#       @alarm.name = "awesome"
#       @alarm.save
#     end
# 
#     it "should find by name" do
#       AlarmIt::Alarm.find_or_create_all_with_like_by_name("awesome").should == [@alarm]
#     end
# 
#     it "should find by name case insensitive" do
#       AlarmIt::Alarm.find_or_create_all_with_like_by_name("AWESOME").should == [@alarm]
#     end
# 
#     it "should create by name" do
#       lambda {
#         AlarmIt::Alarm.find_or_create_all_with_like_by_name("epic")
#       }.should change(AlarmIt::Alarm, :count).by(1)
#     end
# 
#     it "should find or create by name" do
#       lambda {
#         AlarmIt::Alarm.find_or_create_all_with_like_by_name("awesome", "epic").map(&:name).should == ["awesome", "epic"]
#       }.should change(AlarmIt::Alarm, :count).by(1)
#     end
# 
#     it "should return an empty array if no alarms are specified" do
#       AlarmIt::Alarm.find_or_create_all_with_like_by_name([]).should == []
#     end
#   end
# 
#   it "should require a name" do
#     @alarm.valid?
#     
#     if ActiveRecord::VERSION::MAJOR >= 3
#       @alarm.errors[:name].should == ["can't be blank"]
#     else
#       @alarm.errors[:name].should == "can't be blank"
#     end
# 
#     @alarm.name = "something"
#     @alarm.valid?
#     
#     if ActiveRecord::VERSION::MAJOR >= 3      
#       @alarm.errors[:name].should == []
#     else
#       @alarm.errors[:name].should be_nil
#     end
#   end
# 
#   it "should equal a alarm with the same name" do
#     @alarm.name = "awesome"
#     new_alarm = AlarmIt::Alarm.new(:name => "awesome")
#     new_alarm.should == @alarm
#   end
# 
#   it "should return its name when to_s is called" do
#     @alarm.name = "cool"
#     @alarm.to_s.should == "cool"
#   end
# 
#   it "have named_scope named(something)" do
#     @alarm.name = "cool"
#     @alarm.save!
#     AlarmIt::Alarm.named('cool').should include(@alarm)
#   end
# 
#   it "have named_scope named_like(something)" do
#     @alarm.name = "cool"
#     @alarm.save!
#     @another_alarm = AlarmIt::Alarm.create!(:name => "coolip")
#     AlarmIt::Alarm.named_like('cool').should include(@alarm, @another_alarm)
#   end
# end
