# frozen_string_literal: true

module Validators
  class NumericInputValidator

    def check_all(value)
      value_integer?(value) && value_in_correct_range?(value) && value_fibonacci_element?(value)
    end

    def value_integer?(value)
      value.match?(/\A\d+\n\z/)
    end

    def value_in_correct_range?(value)
      (1..13).cover? value.to_i
    end

    def value_fibonacci_element?(value)
      first_numb = Math.sqrt((5 * (value.to_i ** 2) + 4))
      second_numb = Math.sqrt((5 * (value.to_i ** 2) - 4))
      (first_numb == first_numb.round || second_numb == second_numb.round)
    end

  end
end