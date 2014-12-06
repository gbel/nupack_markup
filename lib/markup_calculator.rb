MarkupCalcArgError = Class.new(ArgumentError)

class MarkupCalc
    attr_reader :base_price, :materials, :req_persons

    def initialize(**kwargs)
        validate_req_params(kwargs)
        @base_price = kwargs[:base_price]
        @materials = kwargs[:materials]
        @req_persons = kwargs[:req_persons]
    end

    def validate_req_params(args = {})
        unless args[:base_price]
            raise MarkupCalcArgError.new("Missing Base Price")
        end
        unless args[:materials]
            raise MarkupCalcArgError.new("Missing Materials")
        end
        unless args[:req_persons]
            raise MarkupCalcArgError.new("Missing number of workers")
        end
    end
end
