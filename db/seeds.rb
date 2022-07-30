require 'database_cleaner/active_record'

# Erase the content of all tables, hence reseting the related "id" counters
DatabaseCleaner.clean_with(:truncation)

# Initializing cohorts' dimensions

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

# API and User identification key generator
def shaRcadekeygen(my_num_char)
  charset = Array('A'..'Z') + Array('a'..'z') + Array('0'..'9')
  Array.new(my_num_char) { charset.sample }.join
end

puts "  > Starts seeding ShaRcade DB with 'Admin(s)' (role: 2)"

  User.create(email: "lkouninef@hotmail.com",
              password: "Maischat69+",
              nickname: "Wizard",
              firstname: "Lois",
              lastname: "Kouninef",
              role: 2,
              user_key: shaRcadekeygen(16))
  puts "    - Created a new 'Admin'... User ID: #{User.last.id} - Nickname: #{User.last.nickname} - First name: #{User.last.firstname} - Last name: #{User.last.lastname} - E-mail: #{User.last.email} - Gender: #{User.last.gender} - Role: #{User.last.role} - User 128-bit Key: #{User.last.user_key}"

puts "  > Finished seeding ShaRcade DB with 'Admin(s)'"
puts

puts "  > Starts seeding DB with 'Game Type' objects"
game_type_cohort.each do |my_game_type|
  GameType.create(game_type_title: my_game_type[0],
                  game_type_descr: my_game_type[1] + " (e.g. " + my_game_type[2] + ")")
  puts "    - Created a new 'Game Type'... Game Type ID: #{GameType.last.id} - Title: #{GameType.last.game_type_title} - Description (example): #{GameType.last.game_type_descr.slice(0,49)}..."
end
puts "  > Finished seeding DB with 'Game Type' objects"
puts
