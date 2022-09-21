String fakeImage =
    'https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/kA1AnCVU0wgxh334wEb8KZLjJDsvyHIA6PhWO6J9.jpg';
String fakeImageSvg = 'https://svgsilh.com/svg/2245651.svg';
String fakeString = 'body from body from body from body from';
const pageSize = 10;

List<String> fakeImages = [
  'https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/plHBofoQ08n1ArtrFso0Tw7mGqX36XLiKkK1DOhW.jpg',
  'https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/htIRwCPYPuCA7HSOnSr7pvVXrVqyHssCAeDIQGv2.jpg',
  'https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/i4mt41ZEgbkHs5At1VExnP09iNMeQB1y4gmbG48a.jpg',
  'https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/plHBofoQ08n1ArtrFso0Tw7mGqX36XLiKkK1DOhW.jpg',
  'https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/oPx6TIpfUsWbpTWTfDvAHGriPB3Fc64JSOkhwAjg.jpg',
  'https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/oPx6TIpfUsWbpTWTfDvAHGriPB3Fc64JSOkhwAjg.jpg',
  'https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/p8GMeIn7pAFLxIaTkooFJFePslUvu8w0Dxgip4yu.jpg',
  'https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/U4uRm7kvz0gHiV4KmU15EkqCNrHgneKwf32vvPM3.jpg',
  'https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/qamg6Z7C5aZ223rqq9yUj09F8Mh2iqfPejC340tJ.jpg',
  'https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/IywgMQUkWfY6OlKQ6GHmKpOiE9OrzBazVCHVcRvk.jpg',
  'https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/e1rXahfJQ2CPqvT7Vhe1vSsrwgjM0trSJCxrU3pF.jpg',
  'https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/Q2827ULLaBqStebxhH2P0Oi6MNaFktmWGNtSUUpZ.jpg',
];
const List<Map<String, dynamic>> fakeCategoryJson = [
  {
    "id": 1,
    "name": "Women Clothing & Fashion",
    "banner":
        "https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/wrZthxAm8gcnai30MkUUhRpXXOxMHvVFAZUj6MQR.jpg",
    "icon": "",
    "number_of_children": 7,
    "links": {
      "products":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/products/category/1",
      "sub_categories":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/sub-categories/1"
    }
  },
  {
    "id": 2,
    "name": "Men Clothing & Fashion",
    "banner":
        "https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/I29rSXjCeONepkluheLL9okZQBmftl8Xx7tnEm31.jpg",
    "icon": "",
    "number_of_children": 6,
    "links": {
      "products":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/products/category/2",
      "sub_categories":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/sub-categories/2"
    }
  },
  {
    "id": 3,
    "name": "Computer & Accessories",
    "banner":
        "https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/1ocwVkR1OQEs9HEfAIamVteEwjj3M6pvENIhgJU9.jpg",
    "icon": "",
    "number_of_children": 5,
    "links": {
      "products":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/products/category/3",
      "sub_categories":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/sub-categories/3"
    }
  },
  {
    "id": 4,
    "name": "Automobile & Motorcycle",
    "banner":
        "https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/aOk7o8u2EqfRys6FSEi0d8ZF2Z2UPhlqC6AswJTi.jpg",
    "icon": "",
    "number_of_children": 4,
    "links": {
      "products":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/products/category/4",
      "sub_categories":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/sub-categories/4"
    }
  },
  {
    "id": 5,
    "name": "Kids & toy",
    "banner":
        "https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/cwLfZYV4OBNagRx7ETdPxh2Rdo0FaZL5wHlPYmi9.jpg",
    "icon": "",
    "number_of_children": 7,
    "links": {
      "products":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/products/category/5",
      "sub_categories":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/sub-categories/5"
    }
  },
  {
    "id": 6,
    "name": "Sports & outdoor",
    "banner":
        "https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/EFZSYSq3FckW2QxQHLYYjJUh4TdubxLKNpY2mCc3.jpg",
    "icon": "",
    "number_of_children": 4,
    "links": {
      "products":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/products/category/6",
      "sub_categories":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/sub-categories/6"
    }
  },
  {
    "id": 7,
    "name": "Jewelry & Watches",
    "banner":
        "https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/sutkJL8AIAE5ULuEyDl3rGrEPCLAfdOZAPEpbQs2.jpg",
    "icon": "",
    "number_of_children": 4,
    "links": {
      "products":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/products/category/7",
      "sub_categories":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/sub-categories/7"
    }
  },
  {
    "id": 8,
    "name": "Cellphones & Tabs",
    "banner":
        "https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/WvVzyMyskfpt9jwmXa0MNodhz2maZWBAE0qftc57.jpg",
    "icon": "",
    "number_of_children": 4,
    "links": {
      "products":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/products/category/8",
      "sub_categories":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/sub-categories/8"
    }
  },
  {
    "id": 9,
    "name": "Beauty, Health & Hair",
    "banner":
        "https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/Qg3si0yaxHM1v8iGIfP9nF82FUEsFO234nSUD4IT.jpg",
    "icon": "",
    "number_of_children": 3,
    "links": {
      "products":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/products/category/9",
      "sub_categories":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/sub-categories/9"
    }
  },
  {
    "id": 10,
    "name": "Home Improvement & Tools",
    "banner":
        "https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/AfRztW0pXss39FISPmkEMLHowQj7hJyCKWsEsDd6.jpg",
    "icon": "",
    "number_of_children": 4,
    "links": {
      "products":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/products/category/10",
      "sub_categories":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/sub-categories/10"
    }
  },
  {
    "id": 11,
    "name": "Home decoration & Appliance",
    "banner":
        "https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/xDnrl56okQ9KyrVK51kfCQmZ23cwBdnYhBsjr1kW.png",
    "icon": "",
    "number_of_children": 3,
    "links": {
      "products":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/products/category/11",
      "sub_categories":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/sub-categories/11"
    }
  },
  {
    "id": 12,
    "name": "Toy",
    "banner":
        "https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/Pc8DTwAATE442dQ5Q1HJqQ6J8EfwAB1hcEAJ5CrY.jpg",
    "icon": "",
    "number_of_children": 1,
    "links": {
      "products":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/products/category/12",
      "sub_categories":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/sub-categories/12"
    }
  },
  {
    "id": 243,
    "name": "Software",
    "banner":
        "https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/fbSd8XUrfOkwle5OvD0EZbbexAhME0GB8g7t63yA.jpg",
    "icon": "",
    "number_of_children": 0,
    "links": {
      "products":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/products/category/243",
      "sub_categories":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/api/v2/sub-categories/243"
    }
  }
];
final fakeProduct = {
  "id": 132,
  "name": "Analog Black Dial Men's Watch-32-BK-CK",
  "added_by": "admin",
  "seller_id": 9,
  "shop_id": 0,
  "shop_name": "In House Product",
  "shop_logo":
      "https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/ikb1MZlSZBdn6Vn0o8JDFrWuVEeuGMBHV6igl9fc.png",
  "photos": [
    {
      "variant": "",
      "path":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/fbSd8XUrfOkwle5OvD0EZbbexAhME0GB8g7t63yA.jpg"
    },
    {
      "variant": "",
      "path":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/Cu6w9eqfAiqkyS6wu2Fdy5K5lFpOmVe1w9n6PDyQ.jpg"
    },
    {
      "variant": "",
      "path":
          "https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/qQfHSJvkbWTfS1bbmHCtA8ztLjdDICykY2T42ZoU.jpg"
    }
  ],
  "thumbnail_image":
      "https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/5edFrjdpD9egzXAp02JPOyLL6draSpOvGn1m6R6z.jpg",
  "tags": ["Men", "watch", "fashion"],
  "price_high_low": "From \$600.000 to \$650.000",
  "choice_options": [
    {
      "name": "1",
      "title": "Size",
      "options": ["M", "S"]
    }
  ],
  "colors": ["#000000"],
  "has_discount": false,
  "stroked_price": "\$600.000",
  "main_price": "\$600.000",
  "calculable_price": 600,
  "currency_symbol": "\$",
  "current_stock": 9,
  "unit": "pc",
  "rating": 0,
  "rating_count": 0,
  "earn_point": 0,
  "description": "00",
  "video_link": "https://www.youtube.com/results?search_query=active+it+zone",
  "brand": {
    "id": 21,
    "name": "Rolex",
    "logo":
        "https://demo.activeitzone.com/ecommerce_flutter_demo/public/uploads/all/8848Oq69wmiZPnPkB4Zc5kHoR2QLbv0H8CEY0E7B.jpg"
  },
  "link":
      "https://demo.activeitzone.com/ecommerce_flutter_demo/product/analog-black-dial-mens-watch-32-bk-ck-4a5um"
};
