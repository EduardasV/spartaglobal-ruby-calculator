class CalcEngine
  def run_calculator
    puts '------------'
    puts 'What is you name?'
    user_input = gets.chomp
    puts "Your name is #{user_input}"
    puts '------------'
    puts 'select your calculator: (b)asic, (a)dvanced, (i)bmi and (t)trip'
    key_pressed = gets.chomp
    if key_pressed == 'b'
      puts 'enter your operator: +, -, /, *'
      operator = gets.chomp
      puts 'enter your first number:'
      input_number_one = gets.chomp
      puts 'enter your second number:'
      input_number_two = gets.chomp
      puts "Your answer: #{basic_calculator(operator, input_number_one, input_number_two)}"
    elsif key_pressed == 'a'
      puts '(p)ower, (s)quare'
      operator = gets.chomp
      puts 'enter your first number:'
      input_number_one = gets.chomp
      if operator != 's'
        puts 'enter your second number:'
        input_number_two = gets.chomp
      end
      puts "Your answer: #{advanced_calculator(operator, input_number_one, input_number_two)}"
    elsif key_pressed == 'i'
      puts '(i)mperial, (m)etric'
      operator = gets.chomp
      puts 'enter your weight:'
      input_number_one = gets.chomp
      puts 'enter your height:'
      input_number_two = gets.chomp
      puts "Your answer: #{bmi_calculator(operator, input_number_one, input_number_two)}"
    elsif key_pressed == 't'
      puts 'enter your distance:'
      input_number_one = gets.chomp
      puts 'enter your fuel efficiency:'
      input_number_two = gets.chomp
      puts 'enter your cost per galon:'
      input_number_three = gets.chomp
      puts 'enter your speed in mph:'
      input_number_four = gets.chomp
      puts trip_calculator(input_number_one, input_number_two, input_number_three, input_number_four)
    end
  end

  def basic_calculator(operator, num1, num2)
    answer = add_two_numbers(num1, num2) if operator == '+'
    answer = subtract_two_numbers(num1, num2) if operator == '-'
    answer = divide_two_numbers(num1, num2) if operator == '*'
    answer = divide_two_numbers(num1, num2) if operator == '/'
    answer
  end

  def advanced_calculator(operator, num1, num2 = 0)
    answer = power_numbers(num1, num2) if operator == 'p'
    answer = square_number(num1) if operator == 's'
    answer
  end

  def bmi_calculator(operator, num1, num2)
    answer = imperial_bmi(num1, num2) if operator == 'i'
    answer = metric_bmi(num1, num2) if operator == 'm'
    answer
  end

  def add_two_numbers(num1, num2)
    (num1.to_f + num2.to_f).round(2)
  end

  def times_two_numbers(num1, num2)
    (num1.to_f * num2.to_f).round(2)
  end

  def subtract_two_numbers(num1, num2)
    (num1.to_f - num2.to_f).round(2)
  end

  def divide_two_numbers(num1, num2)
    (num1.to_f / num2.to_f).round(2)
  end

  def power_numbers(num1, num2)
    (num1.to_f**num2.to_f)
  end

  def square_number(num1)
    Math.sqrt(num1.to_f).round(2)
  end

  def metric_bmi(num1, num2)
    (num1.to_f / ((num2.to_f / 100)**2)).round(2)
  end

  def imperial_bmi(num1, num2)
    ((num1.to_f * 703) / (num2.to_f**2)).round(2)
  end

  def trip_calculator(distance_input, fuel_efficiency_input, cost_per_galon_input, speed_mph_input)
    speed_number = speed_mph_input.to_f
    fuel_efficiency = fuel_efficiency_input.to_f
    cost_per_galon = cost_per_galon_input.to_f
    distance = distance_input.to_f
    speed_number - 60 if speed_number > 60
    fuel_efficiency - speed_number *= 2
    fuel_efficiency = 2 if fuel_efficiency < 2
    distance = divide_two_numbers(distance, fuel_efficiency)
    total_duration = divide_two_numbers(distance_input, speed_number).round(2)
    total_price = times_two_numbers(distance, cost_per_galon).round(2)
    "Your trip will take #{total_duration} hours and cost £#{total_price}"
  end
end

calc = CalcEngine.new
# calc.run_calculator
