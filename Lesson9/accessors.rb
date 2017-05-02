module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}"
      history_name = "@#{name}_history"

      attr_reader name, "#{name}_history"

      define_method("#{name}=") do |value|
        instance_variable_set(var_name, value)

        history = instance_variable_get(history_name).to_a
        instance_variable_set(history_name, history << value)
      end
    end
  end

  def strong_attr_accessor(hash = {})
    hash.each do |name, type|

      var_name = "@#{name}"

      attr_reader name

      define_method("#{name}=") do |value|
        raise 'Invalid type.' unless value.is_a?(type)

        instance_variable_set(var_name, value)
      end

    end
  end
end