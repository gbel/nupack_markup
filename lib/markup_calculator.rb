MarkupCalcArgError = Class.new(ArgumentError)

class MarkupCalc
    FLAT_MARKUP = 1.05
    PERSON_MARKUP = 0.012
    DRUGS_MARKUP = 0.075
    FOOD_MARKUP = 0.13
    ELECTRONICS_MARKUP = 0.02

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

    def apply_flat_markup()
        return base_price * FLAT_MARKUP
    end

    def person_markup_total()
        return req_persons * PERSON_MARKUP
    end

    def category_markup_total()
        cat = sanitized_category()
        if cat == :drugs
            return DRUGS_MARKUP
        elsif cat == :food
            return FOOD_MARKUP
        elsif cat == :electronics
            return ELECTRONICS_MARKUP
        else
            return 0
        end
    end

    def estimated_cost()
        (apply_flat_markup() * (1 + category_markup_total() + person_markup_total())).round(2)
    end
end
