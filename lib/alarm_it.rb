require "active_record"
require "action_view"

$LOAD_PATH.unshift(File.dirname(__FILE__))

require "alarm_it/alarmable"
require "alarm_it/alarmer"
require "alarm_it/alarm"
require "alarm_it/alarms_helper"

$LOAD_PATH.shift

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.send :include, AlarmIt::Alarmer
  ActiveRecord::Base.send :include, AlarmIt::Alarmable
end

if defined?(ActionView::Base)
  ActionView::Base.send :include, AlarmIt::AlarmsHelper
end