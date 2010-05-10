class MemberVariable < ActiveRecord::Base
  belongs_to :rule
  belongs_to :member_variable_type
  belongs_to :variable
end
