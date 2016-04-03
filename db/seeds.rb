User.destroy_all




puts "Seed started"

# -------------------------------- Users --------------------------------- #
puts "Seeding Users"

julie = User.create(email: "julie@gmail.com",  password: "123soleil")

# ------------------------------------------------------------------------ #







# ------------------------------ Timelines ------------------------------- #
puts "Seeding timelines"

bordeaux = Timeline.create!(
  title: "Mon trip à Bordeaux",
  destination: "Bordeaux",
  budget: 6000,
  user: julie,
  start_date: Date.today + 4.days,
  end_date: Date.today + 12.days
)


# ------------------------------------------------------------------------ #

activite      = Category.create!(name: "Activité")
lieu          = Category.create!(name: "Lieu d'intérêt")
hebergement   = Category.create!(name: "Hébergement")
restauration  = Category.create!(name: "Restauration")
nocturne      = Category.create!(name: "Vie nocturne")
magasin       = Category.create!(name: "Magasin")


# ------------------------------ Steps ------------------------------- #
puts "Seeding steps"

step01 = Step.create!(
  timeline: bordeaux,
  address: "17 place de la bourse,33000,bordeaux",
  title: "Visite de la CCI de Bordeaux",
  scheduled_at: Date.today,
  position: 1,
  category: lieu)

step02 = Step.create!(
  timeline: bordeaux,
  address: "Place Pey Berland, 33000 Bordeaux",
  title: "Visite Tour Pey Berland",
  scheduled_at: Date.today,
  position: 2,
  category: lieu)

step02 = Step.create!(
  timeline: bordeaux,
  address: "1 Cours du 30 Juillet, 33075 Bordeaux",
  title: "Dégustation au CIVB",
  scheduled_at: Date.today,
  position: 3,
  category: restauration)

# ------------------------------------------------------------------------ #



