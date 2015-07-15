namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    # User.create!(name: "Example User",
    #              email: "example@railstutorial.org",
    #              password: "foobar",
    #              password_confirmation: "foobar")
    make_users
    make_microposts
    make_relationships
  end

  def make_users
    5.times do |n|
      if n==0
        name = 'Me'
        email = 'heyongdonghe@qq.com'
        password = '1995126'
        User.create!(name: name,
                     email: email,
                     password: password,
                     password_confirmation: password,
                     admin: true)
      else
        name  = Faker::Name.name
        email = "example-#{n+1}@railstutorial.org"
        password  = "password"
        User.create!(name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
      end  
    end
  end

  def make_microposts
    users = User.all
    40.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end

  def make_relationships
    users = User.all
    user = users.first
    followed_users =  users[2..4]
    followers = users[3]
    followed_users.each { |followed| user.follow!(followed) }
    followers.each      { |follower| follower.follow!(user) }
  end
end