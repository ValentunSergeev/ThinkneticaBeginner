module InstanceCounter
  module ClassMethods
    attr_accessor :instances

    def inherited(subclass)
      subclass.instance_eval { @instances = 0}
    end
  end

  module InstanceMethods

    protected

    def register_instance
      self.class.instances += 1
      parent = self.class
      while (parent = parent.superclass).included_modules.include?(InstanceCounter)
        parent.instances ||= 0
        parent.instances += 1
      end
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
  end
end