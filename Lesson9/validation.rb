module Validation

  AVAILABLE_VALIDATIONS = %i[type format presence length].freeze

  MAX_LENGTH = 4611686018427387903

  ValidationError = Class.new(StandardError)

  module ClassMethods
    def validates(*args, hash)
      args.each do |var_name|
        var_validations = variable_validations(var_name)
        hash.each do |validation, rule|
          raise 'Invalid validation name!' unless AVAILABLE_VALIDATIONS.include?(validation)
          var_validations[validation] = rule
        end
      end
    end

    def initial_validate
      class_eval do
        def self.new(*args)
          obj = super
          obj.validate!
          obj
        rescue ValidationError => e
          puts e
        end
      end
    end

    def inherited(subclass)
      validations = subclass.superclass.class_eval { @validations }
      subclass.class_eval { @validations = validations }
    end

    private

    def variable_validations(var_name)
      instance_variable_get('@validations')[var_name] ||= {}
    end
  end

  module InstanceMethods
    def valid?
      validations = self.class.instance_variable_get('@validations')

      validations.each do |var_name, var_validations|
        variable = instance_variable_get("@#{var_name}")

        var_validations.each do |validation, rule|
          return false unless Validation.send("#{validation}?", rule, variable)
        end
      end

      true
    end

    def validate!
      raise ValidationError, 'Invalid object.' unless valid?
    end
  end

  def self.presence?(presence, variable)
    presence == !variable.to_s.empty?
  end

  def self.format?(format, variable)
    (variable.to_s =~ format).is_a? Integer
  end

  def self.type?(cls, variable)
    variable.is_a? cls
  end

  def self.length?(hash, variable)
    min = hash[:min] || -1
    max = hash[:max] || MAX_LENGTH

    if variable.methods.include?(:length)
      variable.length.between?(min, max)
    else
      variable.to_s.length.between?(min, max)
    end
  end

  private_class_method :presence?, :format?, :type?, :length?

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)

    base.class_eval { @validations = {} }
  end
end
