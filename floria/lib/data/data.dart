import 'package:floria/models/product_model.dart';
import 'package:floria/models/favorite_model.dart';
import 'package:floria/models/profile_model.dart';
import 'package:floria/models/shopping_cart_model.dart';
import 'package:floria/models/popular_product_model.dart';

Product adorable = Product(
    name: "Adorable",
    price: 680,
    meaning:
        "Gypsophila embodies affection, compassion, and admiration. Offering these flowers is a wonderful gesture to express your heartfelt emotions to loved ones.",
    image: "adorable.png",
    category: "Bouquet",
    keywords: ["Gypsophila", "pink", "blue"]);

Product bestwishes = Product(
    name: "Best Wishes",
    price: 2550,
    meaning:
        "meaning of cherish, healing, and Protection to the people around you and as a promise that never change with purity love.",
    image: "best wishes.png",
    category: "Bouquet",
    keywords: ["Lily", "Cotton"]);

Product confession = Product(
    name: "Confession",
    price: 560,
    meaning:
        "meaning of “lovers” You can give to your lover to show your passionate love, appreciation, thankfulness, and admiration.",
    image: "confession.png",
    category: "Bouquet",
    keywords: ["Bougainvillea", "Pyrethrum"]);

Product enchanted = Product(
    name: "Enchanted",
    price: 680,
    meaning:
        "meaning of elegance and sign of eternal commitment, so they are very appropriate as a gift for someone in honor of their love for one another and their marriage.",
    image: "enchanted.png",
    category: "Bouquet",
    keywords: ["Dahlias"]);

Product eternallove = Product(
    name: "Eternal Love",
    price: 3500,
    meaning:
        "Pink carnation flower meanings include gratitude and the concept of never forgetting someone.",
    image: "eternal love.png",
    category: "Bouquet",
    keywords: ["Carnation", "Pink"]);

Product lolita = Product(
    name: "Lolita",
    price: 1800,
    meaning:
        "meaning of forgiveness, respect, purity, and honor. So whether you need to apologize to someone this flower is appropriate for saying I'm sorry or My condolences.",
    image: "lolita.png",
    category: "Bouquet",
    keywords: ["Tulip", "White"]);

Product lovelyscene = Product(
    name: "Lovely scene",
    price: 4500,
    meaning:
        "meaning of true love, It is the ultimate way to say Nothing's gonna change my love for you. It is the universal symbol of romantic love and enduring passion.",
    image: "lovely scene.png",
    category: "Bouquet",
    keywords: ["Rose", "Red", "Gypsophila"]);

Product mysunshine = Product(
    name: "My Sunshine",
    price: 2560,
    meaning:
        "meaning of loyalty, adoration, cheerful flower, and the perfect bloom for a summer flower delivery to brighten someone's mood and said that you are the brightest person I've ever met. with your pure heart.",
    image: "my sunshine.png",
    category: "Bouquet",
    keywords: ["Sunflower", "Daisy", "Lily", "Snapdragon", "Gypsophila"]);

Product puritysweet = Product(
    name: "Purity Sweet",
    price: 2350,
    meaning:
        "meaning of sad sentiment and portrays the idea of rejection or disappointment towards someone with heartfelt gratitude to say, “Thank you” and also “I will never forget you”",
    image: "purity sweet.png",
    category: "Bouquet",
    keywords: ["Carnation", "Yellow", "Pink"]);

Product summervibes = Product(
    name: "Summer Vibes",
    price: 2550,
    meaning:
        "meaning of kindness and beauty or it say The gift for special lady in my life who is comfort in me and make me feel safe in every situation.",
    image: "summer vibes.png",
    category: "Bouquet",
    keywords: ["Dahlias", "Rose", "Protea", "Queen Anne", "Pink"]);

Product sweetheaven = Product(
    name: "Sweet Heaven",
    price: 1650,
    meaning:
        "meaning of grace, innocence, joy, admiration and, sympathy as well as gratitude like your friends, siblings or teachers.",
    image: "sweet heaven.png",
    category: "Bouquet",
    keywords: ["Rose", "Gypsophila", "Pink", "Light Pink"]);

Product candybond = Product(
    name: "Candy Bond",
    price: 1300,
    meaning: "meaning of wealth, fertility, and want you to succeed at work.",
    image: "candy bond.png",
    category: "Vase",
    keywords: ["Lisianthus", "Green"]);

Product cherishluv = Product(
    name: "Cherish luv",
    price: 2000,
    meaning:
        "meaning of eternal love, passion and say The time we spent together was magical. It popular flowers for couples to give each other and to use for weddings. ",
    image: "cherish luv.png",
    category: "Vase",
    keywords: ["Tulip", "Rose", "Snapdragon"]);

Product cloudyluck = Product(
    name: "Cloudy Luck",
    price: 1800,
    meaning:
        "meaning of fascination, and desire to say I'm proud of you along with young love, eternal loyalty, and new beginnings.",
    image: "cloudy luck.png",
    category: "Vase",
    keywords: ["Rose", "Orange", "White"]);

Product neverforget = Product(
    name: "Never forget",
    price: 1500,
    meaning:
        "meaning of heartfelt gratitude to say, I will never forget you. They represent the love and gratitude that are similar to a mother and express the sentiments of blossoming love.",
    image: "never forget.png",
    category: "Vase",
    keywords: ["Tulip", "Pink"]);

Product perfectionista = Product(
    name: "Perfectionista",
    price: 3400,
    meaning:
        "meaning of heartfelt gratitude to say, I will never forget you. They represent the love and gratitude that are similar to a mother and express the sentiments of blossoming love.",
    image: "perfectionista.png",
    category: "Vase",
    keywords: ["Carnation", "Chamomile", "Limonium", "Pink"]);

Product truefeeling = Product(
    name: "True Feeling",
    price: 1500,
    meaning:
        "meaning of hidden love, originality, good luck and fertility, success, achievement, passion and special bonds, and joy and excitement.",
    image: "true feeling.png",
    category: "Vase",
    keywords: ["Tulip", "Orange"]);

List<Product> allProduct = [
  adorable,
  bestwishes,
  confession,
  enchanted,
  eternallove,
  lolita,
  lovelyscene,
  mysunshine,
  puritysweet,
  summervibes,
  sweetheaven,
  candybond,
  cherishluv,
  cloudyluck,
  neverforget,
  perfectionista,
  truefeeling,
];

List<Favorite> favoriteProduct = [
  Favorite(product: adorable),
  Favorite(product: bestwishes),
  Favorite(product: sweetheaven),
  Favorite(product: truefeeling),
  Favorite(product: lolita),
  Favorite(product: mysunshine),
  Favorite(product: lovelyscene)
];

List<Cart> cart = [
  Cart(product: adorable, quantity: 1),
  Cart(product: lolita, quantity: 2),
  Cart(product: mysunshine, quantity: 1),
  Cart(product: eternallove, quantity: 1)
];

List<PopularProduct> popularproduct = [
  PopularProduct(
      name: eternallove.name,
      price: eternallove.price,
      meaning: eternallove.meaning,
      image: eternallove.image,
      category: eternallove.category,
      keywords: eternallove.keywords),
  PopularProduct(
      name: cherishluv.name,
      price: cherishluv.price,
      meaning: cherishluv.meaning,
      image: cherishluv.image,
      category: cherishluv.category,
      keywords: cherishluv.keywords),
  PopularProduct(
      name: mysunshine.name,
      price: mysunshine.price,
      meaning: mysunshine.meaning,
      image: mysunshine.image,
      category: mysunshine.category,
      keywords: mysunshine.keywords)
];

Profile profile = Profile(
    username: "Bidibub-Bidiboo",
    name: "BiBi",
    email: "abuabi@bubi.com",
    phoneNo: "0855555555",
    birthDay: "2024-02-23",
    location: "muict",
    image: "images/profile/userprofile_Bidibub-bidiboo");
