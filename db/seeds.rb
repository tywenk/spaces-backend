require 'faker'
Faker::UniqueGenerator.clear

puts '🌱 Seeding data...'

puts 'Creating users...'
10.times do
	User.create(
		user_hash: Faker::Blockchain::Ethereum.address,
		pfp: rand(0..10),
		is_mod: false,
	)
end

puts 'Creating spaces...'
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
30.times do
	Post.create(
		title: Faker::Games::Overwatch.quote,
		content: Faker::Lorem.paragraph(sentence_count: 3),
		views: 0,
		user: User.all.sample,
		space: Space.all.sample,
	)
end

puts 'Creating replies...'
30.times do
	Reply.create(
		content: Faker::Lorem.paragraph(sentence_count: 3),
		user: User.all.sample,
		post: Post.all.sample,
	)
end

puts '✅ Done seeding!'
