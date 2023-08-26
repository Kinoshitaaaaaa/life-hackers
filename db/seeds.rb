# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "admin@admin.com",
  password: "administrator"
  )

genres = Genre.create!(
  [{name: "掃除・洗濯"},
   {name: "ビジネス"},
   {name: "趣味"},
   {name: "料理"},
   {name: "その他"},
   ] )

#  users = User.create!(
#  [
#    {email: 'olivia@example.com', user_name: 'Lucas', password: 'password', introduction: 'よろしくお願いします！！', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
#    {email: 'james@example.com', user_name: 'James', password: 'password', introduction: 'パンケーキにハマってます。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
#    {email: 'lucas@example.com', user_name: 'Olivia', password: 'password', introduction: '釣り仲間募集してます。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
#  ]
#)
# user.profile_image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")

olivia = User.create!(email: 'olivia@example.com', user_name: 'Olivia', password: 'password', introduction: 'よろしくお願いします！！')
olivia.profile_image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")

james = User.create!(email: 'James@example.com', user_name: 'James', password: 'password', introduction: 'パンケーキにハマってます。')
james.profile_image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")

lucas = User.create!(email: 'Lucas@example.com', user_name: 'Lucas', password: 'password', introduction: '釣り仲間募集してます。')
lucas.profile_image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")

# Post.create!(
#  [
#    {title: '窓拭きに役立つあるもの', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), body: '窓拭きの際には丸めた新聞紙で水拭き・乾拭きを行うと、洗剤を使わなくても綺麗になります。', user_id: users[0].id, genre_id: genres[0].id},
#    {title: '食費を抑える方法', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), body: '食費を抑えるたったひとつの簡単な方法、それは毎月の食費を予め封筒に入れておくことです！そうすることで不思議とその金額内で収めようとする心理的な効果が働くので、ぜひ一度試してみてください。', user_id: users[1].id, genre_id: genres[3].id },
#    {title: 'ハンバーグ作りの時に少しだけ役立つかも', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), body: 'ハンバーグをこねた後の手の汚れは砂糖で落とすことができます。砂糖小さじ1杯を手に取り10秒位こすり合わせて流し、それからハンドソープで洗うとスッキリきれいになります。', user_id: users[2].id, genre_id: genres[3].id}
#  ]
#)
post1 = Post.create!(title: '窓拭きに役立つあるもの', body: '窓拭きの際には丸めた新聞紙で水拭き・乾拭きを行うと、洗剤を使わなくても綺麗になります。', user_id: olivia.id, genre_id: genres[0].id)
post1.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg")

post2 = Post.create!(title: '食費を抑える方法', body: '食費を抑えるたったひとつの簡単な方法、それは毎月の食費を予め封筒に入れておくことです！そうすることで不思議とその金額内で収めようとする心理的な効果が働くので、ぜひ一度試してみてください。', user_id: james.id, genre_id: genres[0].id)
post2.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg")

post3 = Post.create!(title: 'ハンバーグ作りの時に少しだけ役立つかも', body: 'ハンバーグをこねた後の手の汚れは砂糖で落とすことができます。砂糖小さじ1杯を手に取り10秒位こすり合わせて流し、それからハンドソープで洗うとスッキリきれいになります。', user_id: lucas.id, genre_id: genres[0].id)
post3.image.attach(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg")