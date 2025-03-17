def sklonenie(number, one, a, ov)
    ostatok = number % 10

    if number == nil || !number.is_a?(Numeric)
        number = 0
    end

    if (ostatok >= 5 && ostatok <= 9 || ostatok == 0 || (11..14).include?(number))
        return ov
    end

    if (ostatok == 1)
        return one
    end

    if (ostatok >= 2 && ostatok <= 4)
        return a
    end 
end

number = STDIN.gets.chomp.to_i
w1 = STDIN.gets.chomp
w2 = STDIN.gets.chomp
w3 = STDIN.gets.chomp

puts "#{number} #{sklonenie(number, w1, w2, w3)}"