# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%w{文学 人文 社会 ノンフィクション 歴史 ビジネス 投資 科学 医学 コンピュータ 趣味 スポーツ 資格 暮らし 旅行ガイド 語学 英語学習 教育 絵本 コミック ライトノベル ゲーム攻略本 新書}.each.with_index(1) do |cate, idx|
  category = Category.find_by(id: idx) || Category.new(name: cate)
  category.save!
end
