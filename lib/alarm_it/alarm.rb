module AlarmIt
  class Alarm < ::ActiveRecord::Base
  
    attr_accessible :name, :set_at, :repeat_at, :alarmable, :alarmable_type, :alarmable_id, :alarmer, :alarmer_type, :alarmer_id
    
    belongs_to :alarmable, :polymorphic => true
    belongs_to :alarmer, :polymorphic => true
  
    validates_presence_of :name, :alarmable_type, :alarmable_id, :alarmer_type, :alarmer_id, :set_at
  
    validates_each :repeat_at do |alarmable, attr, value|
      if !alarmable.set_at.blank? and !alarmable.repeat_at.blank? and alarmable.repeat_at < alarmable.set_at
        alarmable.errors.add("Repeat time", ": anterior to set time!")
      end
    end
  
    before_validation :set_set_at
  
    default_scope order("alarms.set_at ASC")
    scope :inactivated, order("set_at DESC, repeat_at DESC").where("inactivated_at IS NOT NULL")
    scope :active, order("set_at DESC, repeat_at DESC").where("inactivated_at IS NULL")
    scope :ringing, order("set_at DESC, repeat_at DESC").where("inactivated_at IS NULL AND (set_at < UTC_TIMESTAMP() OR (repeat_at IS NOT NULL AND repeat_at < UTC_TIMESTAMP()))")
  
    def symbols
      "⚠" if ringing?
    end
  
    def ringing?
      (inactivated_at.blank? and (set_at < Time.zone.now or (repeat_at and repeat_at < Time.zone.now))) ? true : false
    end
  
    def inactivated_at_bool=(inactivated_at_bool)
      if inactivated_at_bool.nil?
        self.inactivated_at = ''
      elsif self.inactivated_at.blank?
        self.inactivated_at = Time.zone.now
      end
    end
  
    def types
      ['Allele', 'Cage', 'Mouse', 'Oligo']
    end
  
  
    private
  
    def set_set_at
      if self.set_at.blank? and !self.repeat_at.blank?
        self.set_at = self.repeat_at
        self.repeat_at = nil
      end    
    end
  end
end