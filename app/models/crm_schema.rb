class CrmSchema < CrmSchema
  self.abstract_class = true
  establish_connection :crm
end
