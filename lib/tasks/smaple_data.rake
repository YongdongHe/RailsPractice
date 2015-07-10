namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    # User.create!(name: "Example User",
    #              email: "example@railstutorial.org",
    #              password: "foobar",
    #              password_confirmation: "foobar")
    50.times do |n|
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
end