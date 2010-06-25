require 'nested_has_many_through'
require 'through_association_enhancement'

ActiveRecord::Associations::HasManyThroughAssociation.send :include, NestedHasManyThrough::Association
ActiveRecord::Base.send :include, NestedHasManyThrough::AssociationEnhancement

# BC
if defined?(ActiveRecord::Reflection::ThroughReflection)
  ActiveRecord::Reflection::ThroughReflection.send :include, NestedHasManyThrough::Reflection
else
  ActiveRecord::Reflection::AssociationReflection.send :include, NestedHasManyThrough::Reflection
end
