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
        expect(markup.sanitized_category()).to be(:food)
    end
    it "should add the flat markup of 5%" do 
        markup = MarkupCalc.new(:base_price => 123,
                                :category => 'Food',
                                :req_persons => 1)
        expect(markup.apply_flat_markup()).to eq(129.15)
    end
    it "should add markup for required persons" do
        markup = MarkupCalc.new(:base_price => 123,
                                :category => 'Food',
                                :req_persons => 1)
        expect(markup.person_markup_total()).to eq(1.012)
    end
end
