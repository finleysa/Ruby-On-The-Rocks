require 'spec_helper'
require 'drink'

describe Drink do
  context "create new drink" do
    let(:drink) { Drink.new("Hulk") }
    it "name should be Hulk" do
      drink.name.should == "Hulk"
    end
    it "Should add ingredients" do
      drink.add_ingredients("Vodka, Orange Juice")
      drink.ingredients.length.should == 1
    end
    it "should add mixing instructions" do
      drink.add_instructions("Mix that shiznit with a spoon!")
      drink.instructions.should == "Mix that shiznit with a spoon!"
    end
  end
end
