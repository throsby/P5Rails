puts "🌱 Seeding spices..."

greenhouse = Greenhouse.create(nickname: "Ivy")

puts "🏠 Seeded greenhouse"

tower1 = Tower.create(next_neighbor: nil, greenhouse_id: greenhouse.id, tower_number: (Tower.last == nil ? 1 : Tower.last.id + 1))
tower2 = Tower.create(next_neighbor: tower1.id, greenhouse_id: greenhouse.id, tower_number: Tower.last.id + 1)
tower3 = Tower.create(next_neighbor: tower2.id, greenhouse_id: greenhouse.id, tower_number: Tower.last.id + 1)
tower4 = Tower.create(next_neighbor: tower3.id, greenhouse_id: greenhouse.id, tower_number: Tower.last.id + 1)

puts "🏰 Towers seeded"

#In order for the following_plot ids to be common sense, the instantiations must be upside-down
plot4 = Plot.create(water_level: 0, following_plot: nil, dehydration_rate: 0.1, tower_id: tower1.id, plot_number: (Plot.last == nil ? 1 : Plot.last.id + 1))
plot3 = Plot.create(water_level: 0, following_plot: plot4.id, dehydration_rate: 0.1, tower_id: tower1.id, plot_number: Plot.last.id + 1)
plot2 = Plot.create(water_level: 0, following_plot: plot3.id, dehydration_rate: 0.1, tower_id: tower1.id, plot_number: Plot.last.id + 1)
plot1 = Plot.create(water_level: 0, following_plot: plot2.id, dehydration_rate: 0.1, tower_id: tower1.id, plot_number: Plot.last.id + 1)

plot8 = Plot.create(water_level: 0, following_plot: nil, dehydration_rate: 0.1, tower_id: tower2.id, plot_number: Plot.last.id + 1)
plot7 = Plot.create(water_level: 0, following_plot: plot8.id, dehydration_rate: 0.1, tower_id: tower2.id, plot_number: Plot.last.id + 1)
plot6 = Plot.create(water_level: 0, following_plot: plot7.id, dehydration_rate: 0.1, tower_id: tower2.id, plot_number: Plot.last.id + 1)
plot5 = Plot.create(water_level: 0, following_plot: plot6.id, dehydration_rate: 0.1, tower_id: tower2.id, plot_number: Plot.last.id + 1)

plot12 = Plot.create(water_level: 0, following_plot: nil, dehydration_rate: 0.1, tower_id: tower3.id, plot_number: Plot.last.id + 1)
plot11 = Plot.create(water_level: 0, following_plot: plot12.id, dehydration_rate: 0.1, tower_id: tower3.id, plot_number: Plot.last.id + 1)
plot10 = Plot.create(water_level: 0, following_plot: plot11.id , dehydration_rate: 0.1, tower_id: tower3.id, plot_number: Plot.last.id + 1)
plot9 = Plot.create(water_level: 0, following_plot: plot10.id, dehydration_rate: 0.1, tower_id: tower3.id, plot_number: Plot.last.id + 1)

plot16 = Plot.create(water_level: 0, following_plot: nil, dehydration_rate: 0.1, tower_id: tower4.id, plot_number: Plot.last.id + 1)
plot15 = Plot.create(water_level: 0, following_plot: plot16.id, dehydration_rate: 0.1, tower_id: tower4.id, plot_number: Plot.last.id + 1)
plot14 = Plot.create(water_level: 0, following_plot: plot15.id, dehydration_rate: 0.1, tower_id: tower4.id, plot_number: Plot.last.id + 1)
plot13 = Plot.create(water_level: 0, following_plot: plot14.id, dehydration_rate: 0.1, tower_id: tower4.id, plot_number: Plot.last.id + 1)

puts "🪴 Plots seeded"



puts "✅ Done seeding!"
