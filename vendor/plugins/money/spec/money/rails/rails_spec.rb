require File.dirname(__FILE__) + '/../../spec_helper'
require 'rubygems'
require 'active_record'
require 'money/rails'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => ':memory:')
ActiveRecord::Migration.verbose = false
ActiveRecord::Schema.define do
  create_table :money_examples, :force => true do |t|
    t.integer :credit_amount_in_cents
    t.integer :debit_amount_in_cents
  end
end

class MoneyExample < ActiveRecord::Base
  money :debit_amount
end

class OtherMoneyExample < ActiveRecord::Base
  set_table_name "money_examples"
  
  money :amount, :cents => "debit_amount_in_cents"
  money :precise_amount, :cents => "credit_amount_in_cents", :precision => 3
end

class YetAnotherMoneyExample < ActiveRecord::Base
  set_table_name "money_examples"
  
  money :amount, :allow_nil => false
  money :precise_amount, :allow_nil => false, :precision => 3
end

describe Money, "using the money declaration in an ActiveRecord model" do
  it "should allow dynamic finders to work the same as composed_of" do
    record = MoneyExample.create!(:debit_amount => 100.to_money)
    MoneyExample.find_by_debit_amount(0.to_money).should be_nil
    MoneyExample.find_by_debit_amount(100.to_money).should == record
  end
  
  describe "setter method" do
    it "should pass on money values" do
      MoneyExample.new(:debit_amount => 1.to_money).debit_amount.should == 1.to_money
    end
    
    it "should convert string values to money objects" do
      MoneyExample.new(:debit_amount => '2').debit_amount.should == 2.to_money
    end

    it "should convert numeric values to money objects" do
      MoneyExample.new(:debit_amount => 3).debit_amount.should == 3.to_money
    end

    it "should treat blank values as nil" do
      MoneyExample.new(:debit_amount => '').debit_amount.should be_nil
    end
    
    it "should allow existing amounts to be set to nil with a blank value" do
      me = MoneyExample.new(:debit_amount => 500.to_money)
      me.update_attribute :debit_amount, ''
      me.debit_amount.should be_nil
    end
  end
  
  describe "declaring a money field" do
    it "should allow the field to be declared with a different cents field" do
      ome = OtherMoneyExample.create!(:amount => 5.to_money)
      ome.amount.should == 5.to_money
      ome.reload.amount.should == 5.to_money
      ome.debit_amount_in_cents.should == 5.to_money.cents
    end
    
    it "should allow a default precision to be passed in" do
      expected = Money.new(535, 'USD', 3)
      ome = OtherMoneyExample.new(:precise_amount => "0.535")
      ome.precise_amount.should == expected
      ome.save!
      ome.reload.precise_amount.should == Money.new(535, 'USD', 3)
      ome.credit_amount_in_cents.should == Money.new(535, 'USD', 3).cents
    end

    it "should use the defined precision when building a new model and setting the raw cents" do
      ome = OtherMoneyExample.new(:credit_amount_in_cents => 535)
      ome.precise_amount.should == Money.new(535, 'USD', 3)
    end
  end
  
  describe "defaulting to $0" do
    context "when the amount is nil" do
      it "should default to $0" do
        YetAnotherMoneyExample.new(:amount => nil).amount.should == Money.new(0, 'USD', 2)
      end
    end
    
    context "when the precision is configured" do
      it "should default to $0 with the right precision" do
        YetAnotherMoneyExample.new(:precise_amount => nil).amount.should == Money.new(0, 'USD', 3)
      end
    end
  end
end