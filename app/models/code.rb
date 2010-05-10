class Code < ActiveRecord::Base
  has_many :code_versions, :order => 'created_at desc', :dependent => :destroy
  has_many :rules, :dependent => :destroy
  has_many :rules

  def latest_source
    self.code_versions.first.source
  end
end
