module InstanceCounter
  module ClassMethods
    attr_accessor :instances, :count

    def inherited(subclass)
      subclass.instance_eval do
        @instances = []
        @count = 0
      end
    end

    # @return [Array]
    def all
      instances || []
    end
  end

  module InstanceMethods
    protected

    def register_instance
      cls = self.class

      cls.instances = (cls.instances || []) << self
      cls.count = (cls.count || 0) + 1

      parent = cls.superclass
      while parent.included_modules.include?(InstanceCounter)
        parent.count = (parent.count || 0) + 1
        parent.instances = (parent.instances || []) << self

        parent = parent.superclass
      end
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
  end
end
