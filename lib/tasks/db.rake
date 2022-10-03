namespace :db do
  desc 'Add data for explain'
  task data_for_explain: :environment do
    # Set a option below in mysql before you execute this task
    # SET GLOBAL max_allowed_packet=524288000;

    authors = []
    books = []
    now = Time.current

    categories = Category.all

    10000.times do |i|
      puts "#{i} authors" if i.positive? && (i % 100).zero?

      authors << { name: Faker::Name.name, created_at: now, updated_at: now }
    end

    ActiveRecord::Base.transaction do
      puts 'Insert authors'
      Author.insert_all authors

      Author.all.pluck(:id).each.with_index(1) do |author_id, i|
        puts "#{i} author's book" if i.positive? && (i % 100).zero?

        30.times do
          books << { title: Faker::Book.title, author_id: author_id, category_id: categories.sample.id, in_japanese: [true, false].sample, created_at: now, updated_at: now }
        end
      end

      puts 'Insert books'
      Book.insert_all books
    end

    puts 'Finish!'
  end
end
