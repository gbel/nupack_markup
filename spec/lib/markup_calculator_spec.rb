require 'spec_helper'

describe MarkupCalc do
    it "should raise and error if missing required info" do 
        expect{MarkupCalc.new({})}.to raise_error(MarkupCalcArgError)
    end
    it "initialize the class with required info" do
        markup = MarkupCalc.new(:base_price => 123,
                                :category => 'foo',
                                :req_persons => 1)
        expect(markup.base_price).to eq(123)
        expect(markup.category).to eq('foo')
        expect(markup.req_persons).to eq(1)
    end
    it "category parameter to be marked up should be lower cased symbol" do
        markup = MarkupCalc.new(:base_price => 123,
                                :category => 'Food',
                                :req_persons => 1)
        expect(markup.send(:sanitized_category)).to be(:food)
    end
    it "should add the flat markup of 5%" do 
        markup = MarkupCalc.new(:base_price => 123,
                                :category => 'Food',
                                :req_persons => 1)
        expect(markup.send(:apply_flat_markup)).to eq(129.15)
    end
    it "should add markup for required persons" do
        markup = MarkupCalc.new(:base_price => 123,
                                :category => 'Food',
                                :req_persons => 2)
        expect(markup.send(:person_markup_total)).to eq(0.024)
    end
    it "should add markup for predefined categories ('electronics', 'food', 'drugs')" do
        markup = MarkupCalc.new(:base_price => 123,
                                :category => 'Food',
                                :req_persons => 2)
        expect(markup.send(:category_markup_total)).to eq(0.13)
    end
    it "should return repackaging estimated cost" do
        input_1 = MarkupCalc.new(:base_price => 1299.99,
                                 :category => 'food',
                                 :req_persons => 3)
        input_2 = MarkupCalc.new(:base_price => 5432.00,
                                 :category => 'drugs',
                                 :req_persons => 1)
        input_3 = MarkupCalc.new(:base_price => 12456.95,
                                 :category => 'books',
                                 :req_persons => 4)
        expect(input_1.estimated_cost()).to eq(1591.58)
        expect(input_2.estimated_cost()).to eq(6199.81)
        expect(input_3.estimated_cost()).to eq(13707.63)

    end
end
