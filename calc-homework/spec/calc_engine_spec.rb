# https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
require 'spec_helper'

describe 'Testing the calc engine' do
  before(:all) do
    @calc = CalcEngine.new
  end

  it 'should add two numbers together' do
    expect(@calc.add_two_numbers(1, 1)).to eq(2)
  end

  it 'should divide two numbers together' do
    expect(@calc.divide_two_numbers(6, 2)).to eq(3)
  end

  it 'should multiply two numbers together' do
    expect(@calc.times_two_numbers(6, 2)).to eq(12)
  end

  it 'should subtract two numbers together' do
    expect(@calc.subtract_two_numbers(6, 2)).to eq(4)
  end

  it 'should calclulate trip time and cost' do
    expect(@calc.trip_calculator(60, 40, 12, 65)).to eq('Your trip will take 0.46 hours and cost £18.0')
  end

  it 'should calclulate bmi with imperial units' do
    expect(@calc.imperial_bmi(200, 72)).to eq(27.12)
  end

  it 'should calclulate bmi with metric units' do
    expect(@calc.metric_bmi(80, 190)).to eq(22.16)
  end

  it 'should calclulate number powers' do
    expect(@calc.power_numbers(5, 2)).to eq(25.0)
  end

  it 'should calclulate square number' do
    expect(@calc.square_number(6)).to eq(2.45)
  end
end
