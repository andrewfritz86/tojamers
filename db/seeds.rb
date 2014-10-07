# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Story.destroy_all
Pitch.destroy_all

def random_user_company
  response = HTTParty.get("http://api.randomuser.me/")
  first_name = response['results'][0]['user']['name']['first']
  last_name = response['results'][0][
    'user']['name']['last']
  email = response['results'][0]['user']['email']
  phone = response['results'][0]['user']['phone']
  user_type = "Company" #need to make these lowercase
  password = response['results'][0]['user']['password']
  User.create(first_name: first_name, last_name: last_name, email: email, phone: phone, user_type: user_type, password: password)
end

def random_user_individual
  response = HTTParty.get("http://api.randomuser.me/")
  first_name = response['results'][0]['user']['name']['first']
  last_name = response['results'][0]['user']['name']['last']
  email = response['results'][0]['user']['email']
  phone = response['results'][0]['user']['phone']
  user_type = "Individual" #needs to be lowercase
  password = response['results'][0]['user']['password']
  User.create(first_name: first_name, last_name: last_name, email: email, phone: phone, user_type: user_type, password: password)
end

def random_story
    skills                = ["ruby", "php", "c", "marketing", 'rapid hungover recovery', 'sales', 'able to leap talls buildings']
    url                   = Faker::Internet.url
    description           = Faker::Company.catch_phrase
    linked_in             = Faker::Internet.url
    personal_site         = Faker::Internet.url
    html                  = [true, false].sample
    css                   = [true, false].sample
    ruby_on_rails         = [true, false].sample
    ruby                  = [true, false].sample
    python                = [true, false].sample
    javascript            = [true, false].sample
    product_management    = [true, false].sample
    project_management    = [true, false].sample
    marketing             = [true, false].sample
    ux_design             = [true, false].sample
    redis                 = [true, false].sample
    postgresql            = [true, false].sample
    mysql                 = [true, false].sample
    personal_location     = Faker::Address.city
    personal_description  = Faker::Company.bs
    image_url             = Faker::Company.logo
    business_name         = Faker::Company.name
    logo_url              = Faker::Company.logo
    business_location     = Faker::Address.city
    business_description  = Faker::Company.bs
    my_skills               = "#{skills.sample}, #{skills.sample}, ##{skills.sample}"
    nickname              = Faker::Name.name
    industry              = ["Web Development", "Finance", "Back-end Development", "Media", "Advertising"].sample
    founders              = "#{Faker::Name.name}, #{Faker::Name.name}, #{Faker::Name.name}"
    size                  = rand(100)
    year_founded          = (1975..2014).to_a.sample
    Story.create( user_id: rand(1..50),
                  url: url,
                  description: description,
                  linked_in: linked_in,
                  personal_site: personal_site,
                  skills: my_skills,
                  nickname: nickname,
                  personal_location: personal_location,
                  personal_description: personal_description,
                  image_url: image_url,
                  business_name: business_name,
                  logo_url: logo_url,
                  business_location: business_location,
                  business_description: business_description,
                  industry: industry,
                  founders: founders,
                  size: size,
                  year_founded: year_founded
                )
end

def random_pitch
  Pitch.create(story_id: "#{rand(1..100).to_s}", body: "#{Faker::Lorem.sentence}")
end


ryan = User.create(first_name: "Ryan", last_name: "Parks", email: "rnparks@gmail.com", phone: "(917) 750-2397", user_type: "company", password: "12345")
pj = User.create(first_name: "PJ", last_name: "Hughes", email: "pj@ga.co", phone: "(855) 288-0881", user_type: "company", password: "thisisfake")
phil = User.create(first_name: "Phil", last_name: "Lamplaugh", email: "philco@ga.co", phone: "(855) 288-0881", user_type: "individual", password: "bullshitpassword")
travis = User.create(first_name: "Travis", last_name: "Vander Hoop", email: "trav@ga.co", phone: "(855) 288-0881", user_type: "individual", password: "notrealatall")

#pj_story = Story.create(user_id: 1, url: "https://generalassemb.ly/", description: "GA is building a Website for people who are in a bad place in their life." )
#phil_story = Story.create(user_id: 2, url: "https://www.linkedin.com/pub/phillip-lamplugh/3/7ab/986", description: "I am a Brooding Visionaire." )
#travis_story = Story.create(user_id:3, url: "https://twitter.com/YourFriendTrav", description: "Instructor at GA." )

# # Commented out until Pitch model and controller is created.
#pj_pitch = Pitch.create(body: "I'm looking for a Ruby on Rails Wizard")
#phil_pitch = Pitch.create(body: "I am a Ruby on Rails Wizard.")
#travis_pitch = Pitch.create(body: "I like the Bachelorette.")

#pj_pitch.story = pj_story
#phil_pitch.story = phil_story
#travis_pitch.story = travis_story

#pj_pitch.save
#phil_pitch.save
#travis_pitch.save

#generating random users
25.times do
  random_user_company
  random_user_individual
end

100.times do
  random_story
end


500.times do
  random_pitch
end

# html: html,
#                   css: css,
#                   ruby_on_rails: ruby_on_rails,
#                   ruby: ruby,
#                   python: python,
#                   javascript: javascript,
#                   product_management: product_management,
#                   project_management: project_management,
#                   marketing: marketing,
#                   ux_design: ux_design,
#                   redis: redis,
#                   postgresql: postgresql,
#                   mysql: mysql,




# #####we need to generate a random user/story/and pitch for 2-3 people and 1-2 businesses

# janine = User.create(
#   first_name: "Janine",
#   last_name: "Harper",
#   email: "Janine@gmail.com",
#   phone: "77338829129",
#   user_type: "individual",
#   password: "janine"
#   )

# janines_story = Story.create(
#   skills: "HTML, CSS, Bootstrap, Ruby, Ruby on Rails",
#   linked_in: "PUT THIS IN TOMORROW",
#   personal_site: "PUT THIS IN TOMORROW",
#   personal_description: "Janine Harper is an award-winning journalist who has covered Hurricane Katrina, Lehman Shock, US Presidential Elections and the World Baseball Classic in Cuba . She graduated from Howard University in 1999 and then left for Japan to teach English to school children.

# She’s in the tenth week of a Web Development Immersive at General Assembly making the transition to web developer and hopes to create apps that improve people’s lives.
# When she is not getting into shoving matches with North Korean diplomats, she enjoys living with her husband and daughter on a tree-lined street in Crown Heights. She enjoys snowboarding, camping, writing and using her crockpot.",
#   nickname: "my story",
#   image_url: "https://s3.amazonaws.com/uploads.hipchat.com/39979/1053074/yxJSj6WeztqHnOH/jansheadshot.jpg"
#   )
# janines_story.user = janine
# janines_story.save
# janine.save
# janines_pitch = Pitch.create(
#   body: "Anyone need help with backend stuff? Really trying to work on writing some super RESTful routes!!"
#   )
# janines_pitch.story = janines_story
# janines_pitch.save
# janine.save



# larkin = User.create(
#   first_name: "Mike",
#   last_name: "Larkin",
#   email: "BarkinLarkin@gmail.com",
#   phone: "6461233234",
#   user_type: "individual",
#   password: "larkin"
#   )
# larkins_story = Story.create(
#   skills: "HTML, CSS, Bootstrap, Ruby, Ruby on Rails, radio, media, advertising, gruff brooklyn accents",
#   linked_in: "PUT THIS IN TOMORROW",
#   personal_site: "PUT THIS IN TOMORROW",
#   personal_description: "TRANSFErRING CAREERS INTO DEV FROM MEDIA or something ",
#   nickname: "the saga of larkin",
#   image_url: "http://cdn2-www.wrestlezone.com/assets/uploads/2009/11/file_187255_4_milliondollarman_o.jpg"
#   )
# larkins_story.user = larkin
# larkins_story.save

# larkins_pitch = Pitch.create(
#   body: "ANY HOT GIRLS WANT HELP WITH THEIR BACK END??"
#   )
# larkins_pitch.story = larkins_story
# larkins_pitch.save




# fritzy = User.create(
#   first_name: "Andy",
#   last_name: "Fritz",
#   email: "Andrew.Fritz@gmail.com",
#   phone: "7739979148",
#   user_type: "individual",
#   password: "andy"
#   )
# fritzy_story = Story.create(
#   skills: "Photoshop, Lightroom, Sinatra, HTML, CSS, Bootstrap, Ruby, Ruby on Rails",
#   linked_in: "PUT THIS IN TOMORROW",
#   personal_site: "PUT THIS IN TOMORROW",
#   personal_description: "I'm a world traveler and a wearer of many hats. Most recently, I worked in content management at Warby Parker
#   , and before that, I taught English abroad as volunteer with the Peace Corps. I'm a recent graduate of General Assembly's Web
#   Development Immersive program, and my goal is to build my portfolio and skillset in full-stack web design. In addition to the skills
#   listed above, I have experience with project management and some user experience design experience as well!

#     I'm hoping to work for a company or work on a project that has a clear and admirable mission. I'm a huge self-starter and great at learning on my own
#     but I'd love to be paired with someone looking to teach as well!
#   ",
#   nickname: "my story",
#   image_url: "put this tomorrow"

#   )
# fritzy_story.user = fritzy
# fritzy_story.save

# fritzy_pitch = Pitch.create(
#   body: "Looking to branch out and write some killer CSS!"
#   )
# fritzy_pitch.story = fritzy_story
# fritzy_pitch.save



# ###business user pitches

# toro = User.create(
#   first_name: "Toro",
#   last_name: "Roja",
#   email: "ToroRoja@gmail.com",
#   phone: "4123456675",
#   user_type: "company",
#   password: "toro"
#   )

# toros_story = Story.create(
#   nickname: "marketing",
#     business_name: "Toro's Digital Marketing",
#     business_location: "Yonkers",
#     logo_url: "http://vector-magz.com/wp-content/uploads/2013/06/red-bull-logo-vector1.png",
#     business_description: "Toro Roja marketing is here for all your digital and print marketing needs!
#     We've been around for the better part of 100 years, and you'd never guess it. We're in the process of modernizing
#     our whole business architecture, and we need developers and designers to help us with that transition",
#     industry: "Marketing",
#     founders: "Mike Larkin, Toro Roja",
#     size: 1,
#     year_founded: 1930
#   )

# toros_story.user = toro
# toros_story.save

# toros_pitch = Pitch.create(
#   body: "Calling anyone with solid backbone skills!"
#   )

# toros_pitch.story = toros_story

# toros_pitch.save
