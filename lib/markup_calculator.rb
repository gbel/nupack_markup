MarkupCalcArgError = Class.new(ArgumentError)

class MarkupCalc
    attr_reader :base_price, :category, :req_persons

    def initialize(**kwargs)
        validate_req_params(kwargs)
        @base_price = kwargs[:base_price]
        @category = kwargs[:category]
        @req_persons = kwargs[:req_persons]
    end

    def sanitized_category()
        return category.to_sym.downcase
    end

    def validate_req_params(args = {})
        unless args[:base_price]
            raise MarkupCalcArgError.new("Missing Base Price")
        end
        unless args[:category]
            raise MarkupCalcArgError.new("Missing Category")
        end
        unless args[:req_persons]
            raise MarkupCalcArgError.new("Missing number of workers")
        end
    end
end
