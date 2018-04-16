local score = 0
local highscore = 0
print("Welcome to the guessing game. Try guessing a number until you win!")

::restart::

math.randomseed(os.time())
local randomNumber = math.random(1,100)
local lives = 10

while lives > 0 do
  
  io.write("\nWrite a number: ")
  input = io.read()
  
  if tonumber(input) == nil then 
    
    print("You have to enter a number.")
    goto ending 
    
  end
  
  inputNumber = tonumber(input)
  
  if inputNumber < 1 or inputNumber > 100 then
    
    print("You have to enter a number between 1 and 100.")
    goto ending
    
  end
  
  if inputNumber == randomNumber then
    
    score = score + lives
    print(string.format("\nCongratualations, you won! \nYou have achieved a score of %s.", score))
    break
    
  elseif inputNumber < randomNumber then
    
    print(string.format("You have to go higher. You have %s lives.", lives - 1))  
  
  else 
  
    print(string.format("You have to go lower. You have %s lives.", lives - 1)) 
    
  end
   
  lives = lives - 1
  
  ::ending::
  
end

if lives == 0 then
  
  print(string.format("\nI am tragically sorry, but you lost.\nYou managed to achieve a score of %s.", score))
  
  if highscore ~= 0 then
    
  print(string.format("Your best score so far is %s.", highscore))
  
  end

  score = 0
  
end

if score > highscore then
  
highscore = score

end


print("\nWould you like to continue playing?")

::checking::
  
io.write("\nWrite y or n: ")
input = io.read()

if input == "y" then
  
  goto restart
  
elseif input == "n" then
  
else
  
  print("Please write yes or no only.")
  goto checking
  
end

