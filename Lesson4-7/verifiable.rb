module Verifiable
  module ClassMethods
    def new(*args)
      super
    rescue ValidationError => e
      puts e
    end
  end

  module InstanceMethods
    def valid?
      true
    end

    private

    def validate!
      raise ValidationError, 'Invalid params.' unless valid?
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
  end
end

class ValidationError < StandardError; end