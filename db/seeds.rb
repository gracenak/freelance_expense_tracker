# User.destroy_all
# Gig.destroy_all

# grace = User.create(username: "gracenak", email: "gracenak@gmail.com", password: "grace")
# kate = User.create(username: "kateshaner", email: "kateshaner@gmail.com", password: "kate")

users = [
    {username: "gracenak", email: "grace@gmail.com", password: "grace"},
    {username: "margotbear", email: "margot@gmail.com", password: "margot"},
    {username: "diggypoo", email: "diggy@gmail.com", password: "diggy"}
    ]
    
users.each do |user|
    User.create(user)
end

gigs = [
    {employer: "True Concord", description: "Messiah", date: "2019-12-21", payment: "200", expenses: 12, user_id: 1},
    {employer: "Tucson Ballet Company", description: "Nutcracker", date: "2019-12-17", payment: "350", expenses: 25.61, user_id: 2},
    {employer: "St. Matthews Church", description: "Church Service", date: "2019-11-10", payment: "150", expenses: 0, user_id: 3},
    {employer: "The Book of Mormon", description: "Musical services from 10/17/19-10/20/19. Per service rate @ $300", date: "2019-10-17", payment: "300", expenses: 20, user_id: 1}
]

gigs.each do |gig|
    Gig.create(gig)
end

# Gig.create(employer: "True Concord", description: "Messiah", date: "2019-12-21", payment: "200", expenses: 12, user_id: grace.id)
# Gig.create(employer: "Tucson Ballet Company", description: "Nutcracker", date: "2019-12-17", payment: "350", expenses: 25.61, user_id: grace.id)
# Gig.create(employer: "St. Matthews Church", description: "Church Service", date: "2019-11-10", payment: "150", expenses: 0, user_id: kate.id)
# Gig.create(employer: "The Book of Mormon", description: "Musical services from 10/17/19-10/20/19. Per service rate @ $300", date: "2019-10-17", payment: "300", expenses: 20, user_id: kate.id)
