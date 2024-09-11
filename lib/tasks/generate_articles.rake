namespace :articles do
  desc 'Generate 50 articles with random categories, titles, contents, and published_at'
  task generate: :environment do
    categories = %w[Technology Health Science Education Business]
    title_adjectives = ['Amazing', 'Innovative', 'Future', 'Ultimate', 'Guide to', 'Breakthrough in']
    title_nouns = ['AI', 'Healthcare', 'Quantum Physics', 'Online Learning', 'Startups', 'Blockchain']
    content_starters = [
      'In recent years, the field of',
      'Experts are now looking at',
      'New research shows that',
      'One of the biggest trends in',
      'Many professionals agree that'
    ]
    content_subjects = [
      'has made significant progress.',
      'is disrupting industries.',
      'is changing the way we live.',
      'is offering new opportunities.',
      'is facing unprecedented challenges.'
    ]
    now = Time.now

    50.times do |_i|
      title = "#{title_adjectives.sample} #{title_nouns.sample}"
      content = "#{content_starters.sample} #{categories.sample.downcase} #{content_subjects.sample}"
      category = categories.sample
      published_at = rand(now.beginning_of_year..now)

      Article.create!(
        title:,
        content:,
        category:,
        published_at:
      )
    end

    puts '50 articles with unique titles and contents have been generated successfully.'
  end
end
