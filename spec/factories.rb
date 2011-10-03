Factory.define :user do |user|
  user.name                  "Mike Hoxhuge"
  user.email                 "test@test.com"
  user.password              "testicles"
  user.password_confirmation "testicles"
end

Factory.define :story do |story|
  story.user_id              1
  story.title                "Test Story"
  story.blurb                "Blah blah blah blah blah."
  story.character_count      5
end