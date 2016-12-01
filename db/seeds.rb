Catigory.create!([
  {name: "Organic"},
  {name: "Sunthetic"}
])
CatigoryProduct.create!([
  {lemonaid_id: 2, catigory_id: 2},
  {lemonaid_id: 3, catigory_id: 3},
  {lemonaid_id: 2, catigory_id: 1}
])
Lemonaid.create!([
  {name: "Lemonaid Lite 2", image: "https://s-media-cache-ak0.pinimg.com/236x/0a/f1/39/0af139c8b4a8714cf171e0b65b6acb03.jpg", discription: "Made with Sweet'n Low", price: "3.0"},
  {name: "Arnold Palmer", image: "https://upload.wikimedia.org/wikipedia/commons/0/04/My_new_obsession_the_arnold_palmer!!!_(5184944881).jpg", discription: "Half lemonaid & half Ice tea", price: "0.5"},
  {name: "Strawberry Lemonaid", image: "http://damndelicious.net/wp-content/uploads/2012/08/IMG_5421.jpg", discription: "Fruity sweet & tart", price: "1.0"},
  {name: "Peter's Famous Lemonaid", image: nil, discription: "Made without Sweet'n Low", price: "34.2"}
])
Order.create!([
  {user_id: 1, lemonaid_id: 3, quantity: 2, subtotal: nil, tax: nil, total: nil},
  {user_id: 1, lemonaid_id: 3, quantity: 2, subtotal: nil, tax: nil, total: nil},
  {user_id: 2, lemonaid_id: 3, quantity: 2, subtotal: nil, tax: nil, total: nil},
  {user_id: 2, lemonaid_id: 2, quantity: 2, subtotal: nil, tax: nil, total: nil}
])
User.create!([
  {name: "Casey Platt", email: "kse0824@gmail.com", password_digest: "$2a$10$dFkajUSVy9KvXLUsxuYZzOXmR5Qmz8z0Wpxw9yv98.4L8OlL72Wd."},
  {name: "Justin S", email: "Just@gmail.com", password_digest: "$2a$10$pNow62M3EN8mlAyWHwMXlO1Pqer4UmEj3hOJ5xxlgrApvxpkGaZkW"}
])
