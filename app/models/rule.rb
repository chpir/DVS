class Rule < ActiveRecord::Base
  has_many :member_variables, :dependent => :destroy
  has_many :runs
  belongs_to :database
  has_one :project, :through => :database
  belongs_to :code
  
  def validatee
    validatee = MemberVariable.find(:first, :conditions => {:rule_id => self.id, :member_variable_type_id => MemberVariableType.find_by_name('validatee').id})
  end
end
