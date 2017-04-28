module Verifiable
  def self.included(base)
    base.instance_eval do
      def new(*args)
        super
      rescue RuntimeError => e
        puts e.message
      end
    end
  end

  def valid?
    true
  end

  private

  def validate!
    raise 'Invalid params.' unless valid?
  end
end