User.destroy_all
Timeline.destroy_all
Step.destroy_all


puts "Seed started"

# -------------------------------- Users --------------------------------- #
puts "Seeding Users"

julie = User.create(email: "michel@gmail.com",  password: "1234soleil")

# ------------------------------------------------------------------------ #







# ------------------------------ Timelines ------------------------------- #
puts "Seeding timelines"

californie = Timeline.create!(
  title: "mon trip en californie",
  destination: "californie",
  budget: 6000,
  user: julie,
  start_date: Date.today + 4.days,
  end_date: Date.today + 12.days
)


# ------------------------------------------------------------------------ #



# ------------------------------ Steps ------------------------------- #
puts "Seeding steps"

step01 = Step.create!(timeline: californie,
  adress: "18 place de la bourse,33000,bordeaux",
  title: "étape 01",
  scheduled_at: Date.today,
  position: 1,
  category: "restaurant")

step02 = Step.create!(timeline: californie,
  adress: "californie-02",
  title: "étape 02",
  scheduled_at: Date.today,
  position: 2,
  category: "musée")

step02 = Step.create!(timeline: californie,
  adress: "californie-03",
  title: "étape 03",
  scheduled_at: Date.today,
  position: 3,
  category: "foot")

# ------------------------------------------------------------------------ #



