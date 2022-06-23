#########################
#                       #
#       ShaRcade        #
#  Official seed file   #
#                       #
#  THP Dev Winter 2022  #
#                       #
######################################################################################
#  20220614: JBV - Created SEED file                                                 #
#  20220622: LK - Shamelessly copied and pasted seed from ReactEstate                #
#  20220623: JBV - (Re)took over this barren yet essential task for ShaRcade's sake  #
######################################################################################

# Notice: requires the "faker" and "database_cleaner" gems to be installed / part of the Rails environment
require 'faker'
require 'database_cleaner/active_record'

# Erase the content of all tables, hence reseting the related "id" counters
DatabaseCleaner.clean_with(:truncation)

# Reseting unicity functionning of used Faker categories
Faker::Name.unique.clear
Faker::Ancient.unique.clear
Faker::Game.unique.clear

# Initializing cohorts' dimensions
gender_cohort = ["Female", "Male", "Undefined", "Unknown", "In Progress", "Non-Binary"]
player_cohort = 20
editor_cohort = 10
admin_cohort = [["Loïs", "KOUNINEF"],["Damian","PIERRE-LOUIS"],["Jean-Baptiste","VIDAL"]]
game_cohort = [["Counter Strike: Global Offensive (CS:GO)","https://store.steampowered.com/app/730/CounterStrike_Global_Offensive/",false,"csgo.jpg"],
               ["Tetroïs","https://loiskouninef.github.io/Tetris_React",true, "tetrois.jpg"],
               ["SnaKouninef","https://loiskouninef.github.io/Snake_JSVanilla/",true,"snakouninef.jpg"],
               ["Rust","https://store.steampowered.com/agecheck/app/252490/",false,"rust.jpg"],
               ["Total Annihilation","https://store.steampowered.com/app/298030/Total_Annihilation/",false,"ta.jpg"],
               ["Overwatch","https://playoverwatch.com/fr-fr/",false,"overwatch.jpg"],
               ["Warcraft II","https://www.gog.com/game/warcraft_2_battlenet_edition",false,"warcraft2.jpg"],
               ["Secret of Mana","https://play.google.com/store/apps/details?id=com.square_enix.secret&hl=fr&gl=US",true,"secretofmana.jpg"],
               ["Mariokart Tour","https://mariokarttour.com/fr-FR",true,"mariokarttour.jpg"],
               ["Sonic the Hedgehog™ Classic","https://apps.apple.com/fr/app/sonic-the-hedgehog-classic/id316050001",true,"sonicthehedgehog.jpg"]]
game_type_cohort = [["FPS", "First-Person Shooter Game", "Doom"],
                    ["TPS", "Third-Person Shooter Game", "Gears of Wars"],
                    ["VFG", "Versus Fighting Game", "Street Figther"],
                    ["RTS", "Real-Time Strategy Game", "Starcraft"],
                    ["Simulation", "Any type of game mimiking actions in the real world.", "Flight Simulator"],
                    ["Platform", "Game with 2D or 3D graphics where controled character jumps, climbs, flies or swim between solid platforms and levels.", "Mario Bros."],
                    ["RPG", "Role-Playing Game", "Final Fantasy"],
                    ["MMORPG", "Massive Multiplayer Online Role-Playing Game", "World of Warcraft"],
                    ["MOBA", "Multiplayer Online Battle Arena", "League of Legends"],
                    ["Battle Royale", "Online multiplayer video game genre that blends last-man-standing gameplay with the survival, exploration and scavenging elements of a survival game.", "Players Unknown Battleground (PUBG)"],
                    ["Action/Adventure", "Game genre offering both physical and conceptual challenges, involving characters actions to solve puzzles.", "Zelda"],
                    ["Beat Them All", "Game genre featuring hand-to-hand combat with a large number of opponents, along scrolling, two-dimensional (2D) levels, traditionnaly.", "Street of Rage"],
                    ["Puzzlers", "Puzzle Games", "Braid"],
                    ["Reflexion", "Game genre involving conceptual puzzles and questionning.", "Myst"],
                    ["Survival", "Game genre set in a hostile, intense, open-world environment, where players generally begin with minimal equipment, being required to collect resources, craft tools, weapons, and shelter, so as to survive as long as possible.", "Rust"],
                    ["Survival Horror", "Sub-genre of survival games involving horror graphics, scary ambience and frightening ennemies such as zombies, with a focus on making the player feel even less in control of what happens and capable of predicting the game mechanics.", "Resident Evil"],
                    ["Rogue Like", "Subgenre of RPG generally characterized by a dungeon crawl through procedurally generated levels, turn-based gameplay, grid-based movement, and permanent death of the player character.", "Dead cells"],
                    ["Hack’n’slash", "Also known as Hack and Slay (H&S or HnS) or slash 'em Up, this game genre refers to a gameplay that emphasizes combat with melee-based weapons, such as swords or blades, even if projectile-based combat gears may be involved.", "Diablo"],
                    ["Shoot Them Up", "Game in which the protagonist combats a large number of enemies by shooting at them while dodging their fire. Action is usually viewed from a top-down or side-view perspective, and players must use ranged weapons to take action at a distance, relying primarily on reaction times to succeed... Or die.", "R-Type"],
                    ["Sandbox", "Any type of construction game involving and nurturing players' creativity", "Minecraft"],
                    ["Party games", "Short, casual, and generally cute-looking simple games.", "Super Mario Party"],
                    ["Rythms", "Games involving dance, music or singing.", "Guitar Hero"],
                    ["Sport", "Any type of sport simulation.", "Pro Evolution Soccer (PEF)"],
                    ["Racing", "Any type of competitive driving, sailing, steering game.", "Gran Turismo"],
                    ["Other", "Games whose genre cannot be claissified in any other category listed hereby.", "WarioWare"]]

puts
puts ")>--~={ !! SEEDING - Start !! }=~--<("
puts


#############
#           #
#  PLAYERS  #
#           #
##################################
#  id: integer                   #
#  email: string                 #
#  (encrypted_)password: string  #
#  nickname: string              #
#  firstname: string             #
#  lastname: string              #
#  gender: string                #
#  role: 0                       #
##################################
puts "  > Starts seeding ShaRcade DB with 'Players' (role: 0 / default)"
player_cohort.times do |x|
  xstr = x+1 < 10 ? "0#{x+1}" : (x+1).to_s
  User.create(email: "player_#{xstr}@yopmail.com",
              password: "THP2022",
              nickname: Faker::Ancient.unique.hero,
              firstname: Faker::Name.unique.first_name,
              lastname: Faker::Name.unique.last_name,
              gender: gender_cohort[rand(gender_cohort.length)],
              role: 0)
  puts "    - Created a new 'Player'... User ID: #{User.last.id} - Nickname: #{User.last.nickname} - First name: #{User.last.firstname} - Last name: #{User.last.lastname} - E-mail: #{User.last.email} - Gender: #{User.last.gender} - Role: #{User.last.role}"
end
puts "  > Finished seeding ShaRcade DB with 'Players'"
puts


#############
#           #
#  EDITORS  #
#           #
##################################
#  id: integer                   #
#  email: string                 #
#  (encrypted_)password: string  #
#  nickname: string              #
#  firstname: string             #
#  lastname: string              #
#  gender: string                #
#  role: 1                       #
##################################
puts "  > Starts seeding ShaRcade DB with 'Editors' (role: 1)"
editor_cohort.times do |x|
  xstr = x+1 < 10 ? "0#{x+1}" : (x+1).to_s
  User.create(email: "editor_#{xstr}@yopmail.com",
              password: "THP2022",
              nickname: Faker::Ancient.unique.titan,
              firstname: Faker::Name.unique.first_name,
              lastname: Faker::Name.unique.last_name,
              gender: gender_cohort[rand(gender_cohort.length)],
              role: 1)
  puts "    - Created a new 'Editor'... User ID: #{User.last.id} - Nickname: #{User.last.nickname} - First name: #{User.last.firstname} - Last name: #{User.last.lastname} - E-mail: #{User.last.email} - Gender: #{User.last.gender} - Role: #{User.last.role}"
end
puts "  > Finished seeding ShaRcade DB with 'Editors'"
puts


##############
#            #
#  ADMIN(S)  #
#            #
##################################
#  id: integer                   #
#  email: string                 #
#  (encrypted_)password: string  #
#  nickname: string              #
#  firstname: string             #
#  lastname: string              #
#  gender: string                #
#  role: 2                       #
##################################
puts "  > Starts seeding ShaRcade DB with 'Admin(s)' (role: 2)"
admin_cohort.length.times do |x|
  xstr = x+1 < 10 ? "0#{x+1}" : (x+1).to_s
  User.create(email: "admin_#{xstr}@yopmail.com",
              password: "THP2022",
              nickname: Faker::Ancient.unique.god,
              firstname: admin_cohort[x][0],
              lastname: admin_cohort[x][1],
              gender: gender_cohort[rand(gender_cohort.length)],
              role: 2)
  puts "    - Created a new 'Admin'... User ID: #{User.last.id} - Nickname: #{User.last.nickname} - First name: #{User.last.firstname} - Last name: #{User.last.lastname} - E-mail: #{User.last.email} - Gender: #{User.last.gender} - Role: #{User.last.role}"
end
puts "  > Finished seeding ShaRcade DB with 'Admin(s)'"
puts


################
#              #
#  GAME TYPES  #
#              #
#############################
#  id: integer              #
#  game_type_title: string  #
#  game_type_descr: text    #
#############################
puts "  > Starts seeding DB with 'Game Type' objects"
game_type_cohort.each do |my_game_type|
  GameType.create(game_type_title: my_game_type[0],
                  game_type_descr: my_game_type[1] + " (e.g. " + my_game_type[2] + ")")
  puts "    - Created a new 'Game Type'... Game Type ID: #{GameType.last.id} - Title: #{GameType.last.game_type_title} - Description (example): #{GameType.last.game_type_descr.slice(0,49)}..."
end
puts "  > Finished seeding DB with 'Game Type' objects"
puts


###########
#         #
#  GAMES  #
#         #
################################
#  id: integer                 #
#  game_title: string          #
#  game_descr: string          #
#  game_url: string            #
#  game_type_id: integer       #
#  mobile_ready: boolean       #
#  image_url: string           #
################################
puts "  > Starts seeding DB with 'Game' objects"
game_cohort.each do |my_game|
  Game.create(game_title: my_game[0],
              game_descr: Faker::Lorem.paragraph,
              game_url: my_game[1],
              game_type_id: GameType.all.sample.id,
              mobile_ready: my_game[2],
              image_url: my_game[3])
  puts "    - Created a new 'Game'... Game ID: #{Game.last.id} - Game title: #{Game.last.game_title} - Game type: #{GameType.find(Game.last.game_type_id).game_type_descr.slice(0,29)}... - Image URL: #{Game.last.image_url} - Game description: #{Game.last.game_descr.slice(0,29)...}."
end
puts "  > Finished seeding DB with 'Game' objects"
puts


############
#          #
#  SCORES  #
#          #
######################
#  id: integer       #
#  game_id: integer  #
#  user_id: integer  #
#  score: integer    #
######################
puts "  > Starts seeding DB with 'Score' objects"
User.all.each do |my_user|
  Score.create(score: rand(10000000),
               game_id: Game.all.sample.id,
               user_id: my_user.id)
  puts "    - Created a new 'Score'... Score ID: #{Score.last.id} - Score: #{Score.last.score} - Player: #{User.find(my_user.id).firstname} #{User.find(my_user.id).lastname} - Game: #{Game.find(Score.last.game_id).game_title}."
end
puts "  > Finished seeding DB with 'Score' objects"
puts

###############
#             #
#  API_CALLS  #
#             #
######################
#  id: integer       #
#  api_key: string   #
#  game_id: integer  #
#  user_id: integer  #
######################
puts "  > Starts seeding DB with 'API Call' objects"
def apikeygen(my_num_char)
  charset = Array('A'..'Z') + Array('a'..'z') + Array('0'..'9')
  Array.new(my_num_char) { charset.sample }.join
end
Game.all.each do |my_game|
  ApiCall.create(api_key: apikeygen(8),
                 game_id: my_game.id,
                 user_id: User.where(role:1).sample.id)
  puts "    - Created a new 'Api Call'... API Call ID: #{ApiCall.last.id} - API Key: #{ApiCall.last.api_key} - Editor: #{User.find(ApiCall.last.user_id).firstname} #{User.find(ApiCall.last.user_id).lastname} - Game: #{my_game.game_title}."
end
puts "  > Finished seeding DB with 'API Call' objects"
puts


###############
#             #
#  FAVORITES  #
#             #
###########################
#  id: integer            #
#  game_type_id: integer  #
#  game_id: integer       #
#  user_id: integer       #
###########################
puts "  > Starts seeding DB with 'Favorite' objects"
User.where(role:0).or(User.where(role:1)).each do |my_user|
  puts "    - Treating Favorites for User: #{my_user.firstname} #{my_user.lastname}."
  # NB: 2 chance over 3 to generate a 'Favorite Game' for each given user
  if rand(3) != 0
    Favorite.create(user_id: my_user.id, 
                    game_id: Game.all.sample.id)
    puts "      a) Created a new 'Favorite Game'... Favorite ID: #{Favorite.last.id} - Favorite Game: #{Game.find(Favorite.last.game_id).game_title} - User: #{my_user.firstname} #{my_user.lastname}."
  else
    puts "      a) No 'Favorite Game' generated."
  end
  # NB: 2 chance over 3 to generate a 'Favorite Game Type' for each given user
  if rand(3) != 0
    Favorite.create(user_id: my_user.id, 
                    game_type_id: GameType.all.sample.id)
    puts "      b) Created a new 'Favorite Game Type'... Favorite ID: #{Favorite.last.id} - Favorite Game Type: #{GameType.find(Favorite.last.game_type_id).game_type_title} - User: #{my_user.firstname} #{my_user.lastname}."
  else
    puts "      b) No 'Favorite Game Type' generated."
  end
end
puts "  > Finished seeding DB with 'Favorite' objects"
puts


###############
#             #
#  FEEDBACKS  #
#             #
######################
#  id: integer       #
#  rating: integer   #
#  title: string     #
#  content: text     #
#  user_id: integer  #
#  game_id: integer  #
######################
puts "  > Starts seeding DB with 'Feedback' objects"
User.where(role:0).or(User.where(role:1)).each do |my_user|
  # NB: 2 chance over 3 to generate a 'Feedback' for each given user
  if rand(3) != 0
    Feedback.create(rating: rand(6),
                    title: Faker::Lorem.sentence(word_count: 1, supplemental: true, random_words_to_add: 3),
                    content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 3),
                    user_id: my_user.id,
                    game_id: Game.all.sample.id)
    puts "    - Created a new 'Feedback'... Feedback ID: #{Feedback.last.id} - User: #{my_user.firstname} #{my_user.lastname} - Game: #{Game.find(Feedback.last.game_id).game_title} - Rating: #{Feedback.last.rating} - Title: #{Feedback.last.title.slice(0,19)}... - Content: #{Feedback.last.content.slice(0,29)}..."
  else
    puts "    - No 'Feedback' generated for User: #{my_user.firstname} #{my_user.lastname}."
  end
end
puts "  > Finished seeding DB with 'Feedback' objects"
puts

puts
puts ")>--~={ !! SEEDING - Ends !! }=~--<("
puts
puts "Thank you for your patience ;-)"
puts

#########################
#                       #
#       ShaRcade        #
#  Official seed file   #
#                       #
#  THP Dev Winter 2022  #
#                       #
#########################
