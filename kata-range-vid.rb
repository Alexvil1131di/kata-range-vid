module Kata_range

    def valid_format_input(user_input)
        if user_input.match(/(\(|\[)(\d+|-\d+)\,(\d+|-\d+)(\)|\])/) && user_input.scan(/\d+/).map(&:to_i)[0] < user_input.scan(/\d+/).map(&:to_i)[1] then
            return user_input
        else
            return StandardError.new "Invalid input"
        end
    end

    def get_array(user_input)

        limits = "#{user_input[0]}#{user_input[user_input.length-1]}"
        range = user_input.scan(/\d+/)

        case limits

            when "[]"
                seq = (range[0].to_i...range[1].to_i+1)
                return seq.to_a

            when "()"
                seq = (range[0].to_i+1...range[1].to_i)
                return seq.to_a

            when "[)"
                seq = (range[0].to_i...range[1].to_i)
                return seq.to_a
                
            when "(]"
                seq = (range[0].to_i+1...range[1].to_i+1)
                return seq.to_a

            when "{}"
                return range.to_a.map(&:to_i)

        end
            
        
    end

    def valid_group_input(group)

        if group.match(/(\{(?!,))(\d|\,)+(\d+(?!,)\})/) then
            return group
        else
            return StandardError.new "Invalid input"
        end

    end

    def contains(range,group)

        range_array = get_array(valid_format_input(range))
        colection = get_array(valid_group_input(group))

        if (range_array & colection).length == colection.length then
            return true
        else 
            return StandardError.new('do not contain all the elements or non of them')
        end

    end

    def get_all_points(range)
        range_array = get_array(valid_format_input(range))
        return range_array
    end

    def contains_a_range(range1,range2)
        range_array1 = get_array(valid_format_input(range1))
        range_array2 = get_array(valid_format_input(range2))

        if (range_array1 & range_array2).length == range_array2.length then
            return true
        else
            return StandardError.new('do not contains all or non of the array element')
        end
    end

    def show_the_end_points(range)
        range_array = get_array(valid_format_input(range))
        end_points = []
        return end_points.push(range_array[0],range_array[range_array.length-1])
    end

    def overlapse_with(range1,range2)
        range_array1 = get_array(valid_format_input(range1))
        range_array2 = get_array(valid_format_input(range2))

        if (range_array1 & range_array2).length > 0 then
            return true
        else
            return StandardError.new('the elements do not overlapse')
        end
    end

    def is_equal?(range1,range2)
        range_array1 = get_array(valid_format_input(range1))
        range_array2 = get_array(valid_format_input(range2))

        if range_array1 == range_array2 then
            return true
        else
            return StandardError.new('the elements are diferent')
        end
    end




end