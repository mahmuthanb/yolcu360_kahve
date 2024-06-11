var dummyData = [
  {
    "title": "Black Coffee",
    "description":
        "Siyah kahve, öğütülmüş kahve çekirdeklerinin sıcak suda demlenmesiyle yapılır, sıcak olarak servis edilir. Eğer havalı olmak istiyorsanız siyah kahveye doğru adıyla 'café noir' diyebilirsiniz.",
    "ingredients": ["Kahve"],
    "image":
        "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "id": 1,
    "price": 6
  },
  {
    "title": "Latte",
    "description":
        "Dışarıda en popüler kahve içeceği olan latte, bir miktar espresso ve buharda ısıtılmış süt ile biraz köpükten oluşur. Aromasız veya vanilyadan balkabağı baharatlarına kadar her şeyle tatlandırılmış olarak sipariş edilebilir.",
    "ingredients": ["Espresso", "Buharda ısıtılmış süt"],
    "image":
        "https://images.unsplash.com/photo-1561882468-9110e03e0f78?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGxhdHRlfGVufDB8fDB8fHww",
    "id": 2,
    "price": 6
  },
  {
    "title": "Caramel Latte",
    "description":
        "Özel aromalı latte seviyorsanız, karamel latte, buharda ısıtılmış sütün ve karamelin doğal tatlılığı ve kremalığı ile size en iyi deneyimi sunabilir.",
    "ingredients": ["Espresso", "Buharda ısıtılmış süt", "Karamel şurubu"],
    "image":
        "https://images.unsplash.com/photo-1599398054066-846f28917f38?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "id": 3,
    "price": 13
  },
  {
    "title": "Cappuccino",
    "description":
        "Cappuccino, latteye göre daha fazla köpük ve daha az buharda ısıtılmış süt ile yapılır, genellikle üstüne kakao tozu veya tarçın serpilir. Bazen süt yerine krema kullanılan veya aroma eklenen çeşitler de bulunabilir.",
    "ingredients": ["Espresso", "Buharda ısıtılmış süt", "Köpük"],
    "image":
        "https://images.unsplash.com/photo-1557006021-b85faa2bc5e2?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "id": 4,
    "price": 14
  },
  {
    "title": "Americano",
    "description":
        "Siyah kahveye benzer bir tada sahip olan americano, sıcak su ile seyreltilmiş bir espresso atışından oluşur.",
    "ingredients": ["Espresso", "Sıcak su"],
    "image":
        "https://images.unsplash.com/photo-1532004491497-ba35c367d634?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "id": 5,
    "price": 13
  },
  {
    "title": "Espresso",
    "description":
        "Bir espresso atışı tek başına servis edilebilir veya latte ve macchiato gibi çoğu kahve içeceğinin temeli olarak kullanılabilir.",
    "ingredients": ["Espresso"],
    "image":
        "https://images.unsplash.com/photo-1579992357154-faf4bde95b3d?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "id": 6,
    "price": 9
  },
  {
    "title": "Macchiato",
    "description":
        "Macchiato, üstünde küçük bir miktar köpük bulunan bir başka espresso bazlı içecektir. Cappuccino ve doppio arasında mutlu bir ara yerdedir.",
    "ingredients": ["Espresso", "Köpük"],
    "image":
        "https://images.unsplash.com/photo-1557772611-722dabe20327?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "id": 7,
    "price": 9
  },
  {
    "title": "Mocha",
    "description":
        "Çikolata severler için mocha ideal bir içecektir. Mocha, buharda ısıtılmış süt ve köpük ile çikolatalı espresso içeceğidir.",
    "ingredients": ["Espresso", "Buharda ısıtılmış süt", "Çikolata"],
    "image":
        "https://images.unsplash.com/photo-1607260550778-aa9d29444ce1?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "id": 8,
    "price": 6
  },
  {
    "title": "Hot Chocolate",
    "description":
        "Soğuk kış günlerinde bir fincan sıcak çikolata sizi rahat ve mutlu hissettirecektir. Aynı zamanda enerji verici kafein içerir.",
    "ingredients": ["Çikolata", "Süt"],
    "image":
        "https://images.unsplash.com/photo-1542990253-0d0f5be5f0ed?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDh8fGhvdCUyMGNob2NvbGF0ZXxlbnwwfHwwfHx8MA%3D%3D",
    "id": 9,
    "price": 12
  },
  {
    "title": "Chai Latte",
    "description":
        "Kış ortasında lezzetli bir sıcak içecek arıyorsanız chai latte'yi seçin. Kakule ve tarçının birleşimi harika bir tat verir.",
    "ingredients": ["Çay", "Süt", "Zencefil", "Kakule", "Tarçın"],
    "image":
        "https://images.unsplash.com/photo-1578899952107-9c390f1af1b7?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGNoYWklMjBsYXR0ZXxlbnwwfHwwfHx8MA%3D%3D",
    "id": 10,
    "price": 11
  },
  {
    "title": "Matcha Latte",
    "description":
        "Matcha latte, ince öğütülmüş matcha çayı ve süt ile yapılan sağlıklı bir içecektir. Hafif tatlılık, benzersiz bir tat ve hafif bir kafein vuruşu sunar.",
    "ingredients": ["Matcha tozu", "Süt", "Şeker*"],
    "image":
        "https://images.unsplash.com/photo-1536256263959-770b48d82b0a?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bWF0Y2hhJTIwbGF0dGV8ZW58MHx8MHx8fDA%3D",
    "id": 11,
    "price": 15
  },
  {
    "title": "Seasonal Brew",
    "description":
        "Karamel, meyve ve çikolata gibi çeşitli tat tonlarına sahip mevsimsel kahve.",
    "ingredients": ["Kahve"],
    "image":
        "https://images.unsplash.com/photo-1611162458324-aae1eb4129a4?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTg1fHxibGFjayUyMGNvZmZlZXxlbnwwfHwwfHx8MA%3D%3D",
    "id": 12,
    "price": 6
  },
  {
    "title": "Black Tea",
    "description":
        "Siyah çay, Çin'de doğmuştur. Camellia bitkisinin yapraklarından üretilir ve çeşitli meyvelerle tatlandırılabilir. Günlük kullanıma uygun, hoş, sıcak, lezzetli ve aromatik bir içecektir.",
    "ingredients": ["Çay"],
    "image":
        "https://images.unsplash.com/photo-1576092768241-dec231879fc3?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHRlYXxlbnwwfHwwfHx8MA%3D%3D",
    "id": 13,
    "price": 11
  },
  {
    "title": "Iced Latte",
    "description":
        "Iced latte, espresso ve soğutulmuş sütün karıştırılmasıyla yapılan soğuk bir kahve içeceğidir. Buz küpleriyle servis edilir ve café latte iced veya latte on the rocks olarak da bilinir.",
    "ingredients": ["Espresso", "Süt", "Buz", "Şurup"],
    "image":
        "https://images.unsplash.com/photo-1517701550927-30cf4ba1dba5?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aWNlZCUyMGxhdHRlfGVufDB8fDB8fHww",
    "id": 14,
    "price": 7
  },
  {
    "title": "Iced Mocha Latte",
    "description":
        "Iced mocha latte, latte ve mocha'nın birleşimidir ve çikolata ve kahvenin birleşimidir. Soğuk içecek sevenler için çikolata ve kahvenin lezzetli bir deneyimini sunar.",
    "ingredients": ["Espresso", "Buz", "Süt", "Çikolata"],
    "image":
        "https://images.unsplash.com/photo-1642647391072-6a2416f048e5?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzh8fGljZWQlMjBtb2NoYSUyMGxhdHRlfGVufDB8fDB8fHww",
    "id": 15,
    "price": 9
  },
  {
    "title": "Frapino Caramel",
    "description":
        "Bu, üstünde çırpılmış krema bulunan karıştırılmış veya daha doğrusu çalkalanmış bir kahvedir. Sıcak yaz günleri için bir zorunluluktur.",
    "ingredients": [
      "Kahve",
      "Buz",
      "Süt",
      "Karamel şurubu",
      "Çırpılmış krema*",
      "Karamel sosu"
    ],
    "image":
        "https://images.unsplash.com/photo-1662047102608-a6f2e492411f?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZnJhcGlubyUyMGNhcmFtZWx8ZW58MHx8MHx8fDA%3D",
    "id": 16,
    "price": 15
  },
  {
    "title": "Frapino Mocha",
    "description":
        "Çikolata tercih edenler için bir başka ünlü ve lezzetli soğuk içecek. Çikolata ve üstünde çırpılmış krema bulunan bir milkshake tadını düşünün.",
    "ingredients": ["Kahve", "Buz", "Süt", "Kakao", "Çırpılmış krema*"],
    "image":
        "https://images.unsplash.com/photo-1530373239216-42518e6b4063?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZnJhcGlubyUyMG1vY2hhfGVufDB8fDB8fHww",
    "id": 17,
    "price": 14
  },
  {
    "title": "Orange Juice",
    "description":
        "Taze sıkılmış portakal suyumuz hakkında söyleyecek bir şeyimiz yok. Kendiniz denemelisiniz.",
    "ingredients": ["Taze Portakallar", "Buz"],
    "image":
        "https://images.unsplash.com/photo-1600271886742-f049cd451bba?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzF8fG9yYW5nZSUyMGp1aWNlfGVufDB8fDB8fHww",
    "id": 18,
    "price": 12
  },
  {
    "title": "Frozen Lemonade",
    "description":
        "Frozen limonata, taze sıkılmış limon suyu, buz ve tatlandırıcının birleştirilmesiyle yapılan ferahlatıcı bir yaz içeceğidir. Soğuk, ekşi ve tatlı bir lezzet sunar.",
    "ingredients": ["Limon suyu", "Buz", "Şeker*"],
    "image":
        "https://images.unsplash.com/photo-1523371054106-bbf80586c38c?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGxlbW9uYWRlJTIwd2l0aCUyMGljZXxlbnwwfHwwfHx8MA%3D%3D",
    "id": 19,
    "price": 9
  },
  {
    "title": "Lemonade",
    "description":
        "İlk olarak Paris'te bilinen ve daha sonra tüm Avrupa'da çok popüler olan bu tatlı, renksiz, gazlı içecek, limon suyu ve gazlı suyun karıştırılmasıyla yapılır.",
    "ingredients": ["Limon suyu", "Gazlı su", "Bal"],
    "image":
        "https://images.unsplash.com/photo-1621263764928-df1444c5e859?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bGVtb25hZGV8ZW58MHx8MHx8fDA%3D",
    "id": 20,
    "price": 9
  }
];

var dummyMapData = {
  "code": "Ok",
  "routes": [
    {
      "geometry": {
        "coordinates": [
          [29.072008, 41.002638],
          [29.072001, 41.002609],
          [29.07197, 41.002525],
          [29.071936, 41.002464],
          [29.071889, 41.002394],
          [29.071812, 41.002305],
          [29.068621, 41.00223],
          [29.068563, 41.002178],
          [29.067447, 41.00209],
          [29.06703, 41.00218]
        ],
        "type": "LineString"
      },
      "legs": [
        {
          "steps": [],
          "summary": "",
          "weight": 190.8,
          "duration": 190.8,
          "distance": 1224.2
        }
      ],
      "weight_name": "routability",
      "weight": 190.8,
      "duration": 190.8,
      "distance": 1224.2
    }
  ],
  "waypoints": []
};
