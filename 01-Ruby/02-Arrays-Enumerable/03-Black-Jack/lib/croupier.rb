require_relative 'black_jack'

def play_game
  #TODO: make the user play from terminal in a while loop that will stop when the user will not be asking for  a new card
  while game_outcome <= bank_score

  end
end

def state_of_the_game(score, bank)
  # TODO: Returns custom message with player's score and bank's score
   print  "Your score is (score), bank is (bank)"

end

def asking_for_card?(score)
  # TODO: Ask for a card only if the score is less or equal to 21, then returns true or false according to the user's choice
  if score <=21 == true
  elsif == false
end

def build_message_for(outcome)
  #TODO: return specific message depending on the game outcome (= bank's score and user's score)

if outcome [1]> 21
  print"You are over 21... you loose."
if outcome [1] == 21
  print"Black Jack!"
if outcome [1] > outcome [0]
  print "You beat the bank! You win"
if outcome [1] < outcome [0]
  print "Bank beats you! You loose"
end
