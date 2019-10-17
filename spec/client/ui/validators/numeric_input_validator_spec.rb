# frozen_string_literal: true

require 'rails_helper'
require_relative '../../../../app/client/ui/validators/numeric_input_validator'

RSpec.describe Validators::NumericInputValidator, type: :service do

  let (:example_string) {'foo'}
  let (:example_decimal) {"1.2\n"}
  let (:beyond_range_number) {1000}
  let (:not_fibonacci_element) {6}
  let (:value_meets_all_cond) {"1\n"}


  subject(:num_val) {described_class.new}


  context 'checks user input values' do

    it 'returns false when value is string' do
      expect(num_val.value_integer?(example_string)).to be false
    end

    it 'returns false when value is not integer' do
      expect(num_val.value_integer?(example_decimal)).to be false
    end

    it 'returns false when value is not in range <1;13>' do
      expect(num_val.value_in_correct_range?(beyond_range_number)).to be false
    end

    it 'returns false when value is not Fibonacci element' do
      expect(num_val.value_fibonacci_element?(not_fibonacci_element)).to be false
    end

    it 'returns true when value meets all conditions' do
      expect(num_val.check_all(value_meets_all_cond)).to be true
    end

  end
end