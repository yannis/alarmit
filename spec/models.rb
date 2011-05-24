class Alarmable < ActiveRecord::Base
  acts_as_alarmable
end

class Alarmer < ActiveRecord::Base
  acts_as_alarmer
end

# class AlarmableModel < ActiveRecord::Base
#   acts_as_alarmable
#   has_many :unalarmable_models
# end
# 
# class CachedModel < ActiveRecord::Base
#   acts_as_alarmable
# end

# class OtherAlarmableModel < ActiveRecord::Base
#   acts_as_alarmable
# end

# class InheritingAlarmableModel < AlarmableModel
# end
# 
# class AlteredInheritingAlarmableModel < AlarmableModel
#   acts_as_alarmable
# end

# class AlarmerUser < ActiveRecord::Base
#   acts_as_alarmer
# end

# class UnalarmableModel < ActiveRecord::Base
#   belongs_to :alarmable_model
# end