# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
first_user = User.create(name: 'Juwairiyya Sadiq', photo: 'https://e0.pxfuel.com/wallpapers/820/800/desktop-wallpaper-cute-black-girls-black-cartoon-characters-thumbnail.jpg', bio: 'Undisputed Queen of DIY', posts_counter: 0)
second_user = User.create(name: 'Aisha Waleesh', photo: 'https://costumesheaven.b-cdn.net/wp-content/uploads/2022/05/Judy_is_awesome.PNG.jpg', bio: 'CEO Henna Hub UK', posts_counter: 0)
first_post = Post.create(author_id: first_user.id, title:'How to make a table', text: 'Get wood. Get tools. Build table.', comments_counter: 0, likes_counter: 0)
second_post = Post.create(author_id: second_user.id, title:'How to solve a crime', text: 'Catch the criminal.', comments_counter: 0, likes_counter: 0)
first_comment = Comment.create(user_id: first_user.id, post_id: first_post.id, text: 'Great post!')
second_comment = Comment.create(user_id: second_user.id, post_id: second_post.id, text: 'Good post!')
first_like = Like.create(user_id: second_user.id, post_id: first_post.id)
