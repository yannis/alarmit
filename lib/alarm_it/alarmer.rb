module AlarmIt
  module Alarmer
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def acts_as_alarmer
        has_many :alarms, :as => :alarmer, :dependent => :destroy, :include => :alarmable, :class_name => "AlarmIt::Alarm"

        include AlarmIt::Alarmer::InstanceMethods
      end
    end
    
    module InstanceMethods
      def set_alarm(name, alarmable, datetime)
        alarms.create!(:name => name, :alarmable => alarmable, :set_at => datetime)
      end
    end
  end
end
