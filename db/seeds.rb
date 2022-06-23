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

# Notice: requires the "faker" and "database_cleaner" gems to be part of the Rails environment

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
  puts "    - Created a new 'Player'... User ID: #{User.last.id} - Nickname: #{User.last.nickname} - First name: #{User.last.firstname} - Last name: #{User.last.lastname} - E-mail: #{User.last.email} - Password: #{User.last.encrypted_password} - Gender: #{User.last.gender} - Role: #{User.last.role}"
end
puts "  > Finished seeding ShaRcade DB with 'Players'"


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
  puts "    - Created a new 'Editor'... User ID: #{User.last.id} - Nickname: #{User.last.nickname} - First name: #{User.last.firstname} - Last name: #{User.last.lastname} - E-mail: #{User.last.email} - Password: #{User.last.encrypted_password} - Gender: #{User.last.gender} - Role: #{User.last.role}"
end
puts "  > Finished seeding ShaRcade DB with 'Editors'"


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
  puts "    - Created a new 'Admin'... User ID: #{User.last.id} - Nickname: #{User.last.nickname} - First name: #{User.last.firstname} - Last name: #{User.last.lastname} - E-mail: #{User.last.email} - Password: #{User.last.encrypted_password} - Gender: #{User.last.gender} - Role: #{User.last.role}"
end
puts "  > Finished seeding ShaRcade DB with 'Admin(s)'"


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
game_type_cohort.each do |gt_item|
  GameType.create(game_type_title: gt_item[0],
                  game_type_descr: gt_item[1] + " (e.g. " + gt_item[2] + ")")
  puts "    - Created a new 'Game Type'... Game Type ID: #{Game.last.id} - Game Type title: #{Game.last.title} - Game Type description (example): #{Game.last.game_desc}"
end
puts "  > Finished seeding DB with 'Game Type' objects"

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
game_cohort.each do |g_item|
  Game.create(game_title: g_item[0],
              game_descr: Faker::Lorem.paragraph,
              game_url: g_item[1],
              game_type_id: GameType.all.sample.id,
              mobile_ready: g_item[2],
              image_url: g_item[3])
  puts "    - Created a new 'Game'... Game ID: #{Game.last.id} - Game title: #{Game.last.title} - Game description: #{Game.last.game_desc} - Game type: #{Game.last.game_type_id} - Image URL: #{Game.last.image_url}."
end
puts "  > Finished seeding DB with 'Standard Game' objects"

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



###############
#             #
#  FAVORITES  #
#             #
###########################
#  id: integer            #
#  game_type_id: integer  #
#  game_id: integer       #
###########################



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
