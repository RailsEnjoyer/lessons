puts 'how many stars do you want?'
count = STDIN.gets.chomp.to_i
arr = []

def stars(count, arr)
    count.times do
        arr<<"*"
    end
    
    puts 'here is your stars'
    puts arr.join

    #puts "*" * count
end

stars(count, arr)