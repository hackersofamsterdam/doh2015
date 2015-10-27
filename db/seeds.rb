user = User.create email: 'demo@freshswag.xyz', password: 'swagfresh'

channel = user.channels.create name: 'HackerSWAG Blog',
                               url: 'http://hackersofamsterdam.github.io/hackerswag'

Product.create channel: channel,
               image: 'http://hackersofamsterdam.github.io/hackerswag/img/apple_ipad.jpg',
               title: 'Apple iPad Air - 16GB - Zwart',
               price: Money.new(37_900),
               link: 'http://www.bol.com/nl/inwinkelwagentje.html?productId=9200000021554263'

Product.create channel: channel,
               image: 'http://hackersofamsterdam.github.io/hackerswag/img/apple_iphone.jpg',
               title: 'Apple iPhone 6 - 16GB - Zwart',
               price: Money.new(63_900),
               link: 'http://www.bol.com/nl/inwinkelwagentje.html?productId=9200000032845754'

Product.create channel: channel,
               image: 'http://hackersofamsterdam.github.io/hackerswag/img/apple_macbook.jpg'

Product.create channel: channel,
               image: 'http://hackersofamsterdam.github.io/hackerswag/img/apple_ipod.jpg'
