require 'minitest/autorun'
require_relative "kata-range-vid.rb"
include Kata_range

class Test_kata_range_vid < Minitest::Test
    
    def test_input_should_recive_a_valid_range_with_parenthesis_at_the_edge
        assert_equal '(5,41)', Kata_range.valid_format_input('(5,41)')
    end

    def test_input_should_recive_a_valid_range_with_brackets_at_the_edge
        assert_equal '[5,41]', Kata_range.valid_format_input('[5,41]')
    end

    def test_input_should_recive_a_valid_range_with_parenthesis_and_brackets_at_the_edge
        assert_equal '[5,41)', Kata_range.valid_format_input('[5,41)')
    end

    def  test_should_not_recive_any_type_of_symbols_exept_for_a_comma
        assert_equal '[5,41)', Kata_range.valid_format_input('[5,41)')
    end

    def test_should_not_recive_letters
        assert_equal StandardError.new('Invalid input'), Kata_range.valid_format_input('[5,4js1)')
    end

    def test_should_recive_negative_numbers
        assert_equal '[-5,41)', Kata_range.valid_format_input('[-5,41)')
    end

    def test_first_number_should_be_minor_than_the_second_number
        assert_equal StandardError.new('Invalid input'), Kata_range.valid_format_input('[41,5)')
    end

    def test_all_the_alements_of_the_range_should_be_on_an_array
        assert_equal [3,4,5], Kata_range.get_array('[3,5]')
    end

    def test_groups_of_numbers_should_recive_a_valid_group_limited_by_angle_brackets
        assert_equal '{5,41,3,5}', Kata_range.valid_group_input('{5,41,3,5}')
    end

    def test_groups_of_numbers_should_not_recive_letters
        assert_equal StandardError.new('Invalid input'), Kata_range.valid_group_input('{5,41s}')
    end

    def test_groups_of_numbers_should_not_recive_letters_and_symbols
        assert_equal StandardError.new('Invalid input'), Kata_range.valid_group_input('{5,41?s}')
    end

    def test_groups_of_numbers_should_not_recive_symbols
        assert_equal StandardError.new('Invalid input'), Kata_range.valid_group_input('{5,41,4,5?}')
    end

    def test_groups_should_be_an_array
        assert_equal [3,4,5], Kata_range.get_array('{3,4,5}')
    end

    def test_should_show_if_one_range_contains_all_the_elements_of_a_group
        assert_equal true, Kata_range.contains("[2,8]", "{5,7}")
    end

    def test_should_show_all_the_elements_of_a_range
        assert_equal [7,8], Kata_range.get_all_points("(6,9)")
    end

    def test_if_a_range_contains_all_the_elements_of_an_other_range
        assert_equal true, Kata_range.contains_a_range("[2,9]","[3,4]")
    end

    def test_should_return_the_end_points_of_the_range
        assert_equal [4,5], Kata_range.show_the_end_points("(3,6)")
    end

    def test_if_the_ranges_overlaps_each_other
        assert_equal true, Kata_range.overlapse_with("(3,6)", "[4,89]")
    end

    def test_if_two_ranges_are_equal
        assert_equal true, Kata_range.is_equal?('[3,6]', '(2,7)')
    end



end