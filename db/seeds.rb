require 'faker'
Faker::UniqueGenerator.clear

puts '🌱 Seeding data...'

puts 'Creating users...'
15.times do
	User.create(user_hash: Faker::Blockchain::Ethereum.address, is_mod: false)
end

$colors = %w[
	#74cf8c
	#ca74cf
	#fa4353
	#fce24c
	#b9e649
	#f03c13
	#230cf2
	#0cdbf2
	#18ed11
]

puts 'Creating shields...'
l = User.all.size
x = 0
while x < l
	Shield.create(
		fieldId: rand(0..299),
		hardwareId: rand(0..120),
		frameId: rand(0..5),
		color1: $colors.sample,
		color2: $colors.sample,
		color3: $colors.sample,
		color4: $colors.sample,
		user: User.all[x],
	)
	x = x + 1
end

puts 'Creating spaces...'
Space.create(
	space_name: 'all',
	description: Faker::Lorem.sentence(word_count: 10),
)
Space.create(
	space_name: 'wordcel',
	description: Faker::Lorem.sentence(word_count: 10),
)
Space.create(
	space_name: 'shape-rotatoor',
	description: Faker::Lorem.sentence(word_count: 10),
)
Space.create(
	space_name: 'optimizoor',
	description: Faker::Lorem.sentence(word_count: 10),
)
Space.create(
	space_name: 'curatoor',
	description: Faker::Lorem.sentence(word_count: 10),
)

puts 'Creating posts...'
20.times do
	Post.create(
		title: Faker::Games::Overwatch.quote,
		content: Faker::Markdown.random,
		views: 0,
		user: User.all.sample,
		space: Space.all.sample,
	)
end

puts 'Creating replies...'
40.times do
	Reply.create(
		content: Faker::Markdown.random,
		user: User.all.sample,
		post: Post.all.sample,
	)
end

puts '✅ Done seeding!'
