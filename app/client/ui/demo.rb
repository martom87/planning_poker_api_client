# frozen_string_literal: true

require_relative '../../../app/client/client_controllers/client_api_controller'
require_relative 'validators/numeric_input_validator'
require 'pry'

finish = 0
num_val = Validators::NumericInputValidator.new

while finish != 3
  puts 'what are we doing?'
  puts '1-create team, 2-create team member 3-exit program'
  action = gets.chomp.to_i
  case action
  when 1
    client_controller = nil
    counter = 0
    puts 'creating new team with random name'
    puts 'how many members?'
    members_amount = gets
    if num_val.value_integer?(members_amount)
      client_controller = ClientControllers::ClientApiController.new(members_amount: members_amount.to_i)
      puts "created #{client_controller.team_name} team with #{client_controller.team_member_amount} possible members"
    else
      puts 'members amount should be integer number, team cannot be created'
    end
  when 2
    if client_controller != nil
      if counter < client_controller.team_member_amount
        loop do
          counter += 1
          puts "creating member #{counter}/#{client_controller.team_member_amount}"
          puts 'write member name'
          member_name = gets.chomp.to_s
          puts 'write member voice'
          vote = gets
          num_val.check_all(vote) ? client_controller.add_team_members(member_name, vote) :
              (puts 'vote should be Fibonacci element in range <1;13>,create user again'; counter -= 1)
          break if counter >= client_controller.team_member_amount && num_val.value_integer?(vote)
        end
      end
      response = client_controller.add_team_members('member_name', 8)
      puts client_controller.generate_report(response)
    else
      puts 'create team first'
    end
  when 3
    puts 'Good bye'
    finish = 3
  else
    puts 'Incorrect operation, please try again'
  end
end

