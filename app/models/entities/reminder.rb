# frozen_string_literal: true

class Reminder < CrmSchema
    self.inheritance_column = :_type_disabled
    
    belongs_to :lead
end