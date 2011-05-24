module AlarmIt
  module Alarmable
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def acts_as_alarmable
        has_many :alarms, :as => :alarmable, :dependent => :destroy, :include => :alarmer, :class_name => "AlarmIt::Alarm"
      end
    end
  end
end
