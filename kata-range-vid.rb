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



end