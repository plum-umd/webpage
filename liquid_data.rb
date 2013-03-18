module LiquidData
  class ValidationError < RuntimeError; end

  module ClassMethods
    attr_reader :fields, :readers

    def fields
      @fields = [] unless @fields
      @fields
    end

    def readers
      @readers = {} unless @readers
      @readers
    end

    def liquid_data(*args, &blk)
      attr_reader *args
      fields.concat(args.map { |f| f.to_s })
      args.each { |f| readers[f.to_s] = blk } if blk
    end

    def validate(map)
      map.each_key do |k|
        unless fields.include? k
          raise ValidationError, "unknown key #{k} in map: #{map}"
        end
      end
    end

    def parse(map)
      validate(map)
      obj = new
      fields.each do |f|
        val = map[f.to_s]
        val = readers[f].call(val) if val && readers[f]
        obj.instance_variable_set("@#{f}", val)
      end
      obj
    end
  end

  def self.included(base)
    base.send :extend, ClassMethods
  end

  def to_liquid
    self.class.fields.inject({}) do |x,y|
      x.merge({y.to_s => instance_variable_get("@#{y}")})
    end
  end  
end
