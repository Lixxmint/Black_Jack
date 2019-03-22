class Interface
  LINE = '_-' * 10
  RESULT_MESSAGES = ['YOU WON!!!','DRAW', 'YOU LOSE!'].freeze
  OPTION = ['[1] take card', '[2] open card', '[3] skip'].freeze
  MENU = ['[t]ake card', '[o]pen cards', '[s]kip'].freeze
  OPEN = 0
  TAKE_CARD = 1

  def show_money(user, dealer, bank)
    puts "#{user.name} - #{user.money}$"
    puts "Dealer - #{dealer.money}$"
    puts "Bank - #{bank.money}"
    puts ''
  end

  def user_name
    puts "Enter your name:"
    gets.chomp
  end

  def show_cards(user, dealer)
    puts user
    puts dealer
  end

  def show_result(result, user, dealer)
    puts ''
    puts LINE
    puts "#{RESULT_MESSAGES[result]}"
    puts LINE
    puts ''
  end

  def start_messages
    puts "-_-_-_-_-_-_-_-_- Black Jack Game -_-_-_-_-_-_-_-_-\n"
  end

  def user_selection(can_take)
    puts ''
    print "#{MENU[0]}, " if can_take
    print "#{MENU[1]}, #{MENU[2]} :"
    selection = gets.chomp.upcase
    return OPEN if selection == 'O'
    return TAKE_CARD if selection == 'T'

    false
  end

  def repeat_game?
    puts 'Play again? (y/n) '
    answer = gets.chomp
    puts ''
    true if answer == 'y'
  end
end
