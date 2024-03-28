import 'package:e_commerce_app/features/shop/models/banner_model.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/features/shop/models/product_attibute_model.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/features/shop/models/product_variation_model.dart';
import 'package:e_commerce_app/utils/constants/image_string.dart';

class AppDummyData {
  // list of banner
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: AppImages.promoBanner1,
        active: true,
        targetScreen: 'targetScreen'),
    BannerModel(
        imageUrl: AppImages.promoBanner2,
        active: true,
        targetScreen: 'targetScreen'),
    BannerModel(
        imageUrl: AppImages.promoBanner3,
        active: true,
        targetScreen: 'targetScreen'),
  ];

  //list of all categories
  static final List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      name: 'Sports',
      image: AppImages.sportIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      name: 'Electronics',
      image: AppImages.electronicsIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      name: 'Clothes',
      image: AppImages.clothIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      name: 'Animals',
      image: AppImages.animalIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      name: 'Furniture',
      image: AppImages.furnitureIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      name: 'Shoes',
      image: AppImages.shoeIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      name: 'Cosmetics',
      image: AppImages.cosmeticsIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '8',
      name: 'Jewelry',
      image: AppImages.jeweleryIcon,
      isFeatured: true,
    ),
  ];

  // list of all Product
  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      stock: 15,
      price: 299,
      isFeatured: true,
      title: 'Green Nike Sports Shoes',
      description: 'Green Nike Sports Shoes',
      productType: 'ProductType.variable',
      thumbnail: AppImages.productImage1,
      brand: BrandModel(
        id: '1',
        image: AppImages.nikeLogo,
        name: 'Nike',
        productCount: 140,
        isFeatured: true,
      ),
      images: [
        AppImages.productImage23,
        AppImages.productImageitem1,
        AppImages.productImageitem2,
      ],
      salePrice: 179,
      sku: 'ABD4350',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stack: 34,
          price: 299,
          salePrice: 179,
          image: AppImages.productImage1,
          description: 'This is the product description for nike sports shoes',
          attributeValue: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stack: 24,
          price: 250,
          salePrice: 187.8,
          image: AppImages.productImageitem1,
          description: 'This is the product description for nike sports shoes',
          attributeValue: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stack: 342,
          price: 345,
          salePrice: 265,
          image: AppImages.productImageitem2,
          attributeValue: {'Color': 'Black', 'Size': 'EU 30'},
        ),
        ProductVariationModel(
          id: '4',
          stack: 126,
          price: 343,
          salePrice: 317.6,
          image: AppImages.productImage23,
          description: 'This is the product description for nike sports shoes',
          attributeValue: {'Color': 'Blue', 'Size': 'EU 34'},
        ),
      ],
    ),
    ProductModel(
      id: '002',
      stock: 50,
      price: 87,
      isFeatured: false,
      title: 'Blue T-shirt for all ages',
      description:
          'This is a product description for blue t-shirt, there we can added more thing ',
      productType: 'ProductType.single',
      thumbnail: AppImages.productImage69,
      brand: BrandModel(
        id: '6',
        image: AppImages.zaraLogo,
        name: 'Zara',
      ),
      images: [
        AppImages.productImage5,
        AppImages.productImage68,
        AppImages.productImage69,
      ],
      salePrice: 30,
      sku: 'ABH450',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['M', 'L', 'Xl']),
      ],
    ),
    ProductModel(
      id: '003',
      stock: 40,
      price: 40,
      isFeatured: false,
      title: 'Lather Brown Jacket',
      description:
          'This is a product description for Lather Brown jacket, there we can added more thing ',
      productType: 'ProductType.single',
      thumbnail: AppImages.productImage64,
      brand: BrandModel(
        id: '6',
        image: AppImages.zaraLogo,
        name: 'Zara',
      ),
      images: [
        AppImages.productImage64,
        AppImages.productImage65,
        AppImages.productImage66,
        AppImages.productImage67,
      ],
      salePrice: 30,
      sku: 'ABH457',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['M', 'L', 'Xl']),
      ],
    ),
    ProductModel(
      id: '004',
      stock: 34,
      price: 145,
      isFeatured: true,
      title: '4 color t-shirt dry fit',
      description:
          'This is a product description for 4 color t-shirt, there we can added more thing ',
      productType: 'ProductType.variable',
      thumbnail: AppImages.productImage60,
      brand: BrandModel(
        id: '6',
        image: AppImages.zaraLogo,
        name: 'Zara',
      ),
      images: [
        AppImages.productImage61,
        AppImages.productImage62,
        AppImages.productImage63
      ],
      salePrice: 48,
      sku: 'ABD43550',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Green', 'Black', 'Red', 'Yellow']),
        ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stack: 34,
          price: 145,
          salePrice: 48,
          image: AppImages.productImage61,
          description:
              'This is a product description for 4 color t-shirt, there we can added more thing ',
          attributeValue: {'Color': 'Green', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '2',
          stack: 24,
          price: 99,
          salePrice: 67.9,
          image: AppImages.productImage62,
          description:
              'This is a product description for 4 color t-shirt, there we can added more thing ',
          attributeValue: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stack: 342,
          price: 111,
          salePrice: 67,
          image: AppImages.productImage63,
          attributeValue: {'Color': 'Black', 'Size': 'EU 30'},
        ),
        ProductVariationModel(
          id: '4',
          stack: 126,
          price: 78,
          salePrice: 37.2,
          image: AppImages.productImage60,
          description: 'This is the product description for nike sports shoes',
          attributeValue: {'Color': 'Blue', 'Size': 'EU 34'},
        ),
      ],
    ),
    ProductModel(
      id: '005',
      stock: 54,
      price: 485,
      isFeatured: false,
      title: 'Nike Air Jordan Shoes',
      description:
          'This is a product description for Nike Air Jordan , there we can added more thing ',
      productType: 'ProductType.variable',
      thumbnail: AppImages.productImage10,
      brand: BrandModel(
        id: '1',
        image: AppImages.nikeLogo,
        name: 'Nike',
      ),
      images: [
        AppImages.productImage10,
        AppImages.productImage8,
        AppImages.productImage9,
      ],
      salePrice: 300,
      sku: 'ABR43550',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Green', 'Black', 'Red', 'Yellow']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 30', 'EU 40', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stack: 16,
          price: 14,
          salePrice: 12.6,
          image: AppImages.productImage7,
          description:
              'This is a product description for Nike Air Jordan , there we can added more thing ',
          attributeValue: {'Color': 'Green', 'Size': 'EU 30'},
        ),
        ProductVariationModel(
          id: '2',
          stack: 24,
          price: 134,
          salePrice: 122.6,
          image: AppImages.productImage8,
          description:
              'This is a product description for Nike Air Jordan , there we can added more thing ',
          attributeValue: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stack: 342,
          price: 134,
          salePrice: 122.6,
          image: AppImages.productImage9,
          attributeValue: {'Color': 'Black', 'Size': 'EU 30'},
        ),
        ProductVariationModel(
          id: '4',
          stack: 126,
          price: 134,
          salePrice: 122.6,
          image: AppImages.productImage10,
          description: 'This is the product description for nike sports shoes',
          attributeValue: {'Color': 'Blue', 'Size': 'EU 34'},
        ),
      ],
    ),
    ProductModel(
      id: '006',
      stock: 20,
      price: 750,
      isFeatured: false,
      title: 'SAMSUNG Galaxy S9 (blue 64, GB) (4 GB RAM)',
      description:
          'SAMSUNG Galaxy S9 (blue 64, GB) (4 GB RAM), Long Lasting Battery',
      productType: 'ProductType.single',
      thumbnail: AppImages.productImage11,
      brand: BrandModel(
        id: '7',
        image: AppImages.appleLogo,
        name: 'Samsung',
      ),
      images: [
        AppImages.productImage11,
        AppImages.productImage12,
        AppImages.productImage13,
      ],
      salePrice: 700,
      sku: 'ABH550',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Green', 'Blue', 'Black ']),
        ProductAttributeModel(name: 'Size', values: ['M', 'L', 'Xl']),
      ],
    ),
    ProductModel(
      id: '007',
      stock: 20,
      price: 25,
      isFeatured: false,
      title: 'TOM1 dog food',
      description:
          'This is a product description for TOM dog food , there we can added more thing ',
      productType: 'ProductType.single',
      thumbnail: AppImages.productImage18,
      brand: BrandModel(
        id: '7',
        image: AppImages.animalIcon,
        name: 'TOM1',
      ),
      images: [
        AppImages.productImage11,
        AppImages.productImage12,
        AppImages.productImage13,
      ],
      salePrice: 19,
      sku: 'ABH550',
      categoryId: '10',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Green', 'Blue', 'Black ']),
        ProductAttributeModel(name: 'Size', values: ['M', 'L', 'Xl']),
      ],
    ),
    ProductModel(
      id: '009',
      stock: 40,
      price: 400,
      isFeatured: false,
      title: 'Nike Air jordan 19 Blue',
      description:
          'This is a product description for Nike Air Jordan , there we can added more thing ',
      productType: 'ProductType.single',
      thumbnail: AppImages.productImage19,
      brand: BrandModel(
        id: '1',
        image: AppImages.nikeLogo,
        name: 'Nike',
      ),
      images: [
        AppImages.productImage19,
        AppImages.productImage20,
        AppImages.productImage21,
        AppImages.productImage22,
      ],
      salePrice: 298,
      sku: 'ABH550',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Green', 'Blue', 'Black ']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 30', 'EU 34', 'EU 36']),
      ],
    ),
    ProductModel(
      id: '010',
      stock: 15,
      price: 159,
      isFeatured: true,
      title: 'Track Suit',
      description:
          'This is a product description for track suit , there we can added more thing ',
      productType: 'ProductType.variable',
      thumbnail: AppImages.productImage24,
      brand: BrandModel(
          id: '1',
          image: AppImages.adidasLogo,
          name: 'Adidas',
          productCount: 140,
          isFeatured: true),
      images: [
        AppImages.productImage25,
        AppImages.productImage26,
        AppImages.productImage27
      ],
      salePrice: 96,
      sku: 'ABD4350',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stack: 34,
          price: 159,
          salePrice: 96,
          image: AppImages.productImage24,
          description: 'This is the product description for track suit',
          attributeValue: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stack: 24,
          price: 143,
          salePrice: 110.2,
          image: AppImages.productImage25,
          description: 'This is the product description track suit',
          attributeValue: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stack: 342,
          price: 97,
          salePrice: 89,
          image: AppImages.productImage26,
          attributeValue: {'Color': 'Black', 'Size': 'EU 30'},
        ),
        ProductVariationModel(
          id: '4',
          stack: 126,
          price: 99,
          salePrice: 59.7,
          image: AppImages.productImage27,
          description: 'This is the product description for nike sports shoes',
          attributeValue: {'Color': 'Blue', 'Size': 'EU 34'},
        ),
      ],
    ),
    ProductModel(
      id: '011',
      stock: 40,
      price: 40,
      isFeatured: false,
      title: 'Adidas football',
      description:
          'This is a product description for Adidas football , there we can added more thing ',
      productType: 'ProductType.single',
      thumbnail: AppImages.productImage28,
      brand: BrandModel(
        id: '1',
        image: AppImages.adidasLogo,
        name: 'Adidas',
      ),
      // images: [
      //   AppImages.productImage19,
      //   AppImages.productImage20,
      //   AppImages.productImage21,
      //   AppImages.productImage22,
      // ],
      salePrice: 35,
      sku: 'ABH550',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Green', 'Blue', 'Black ']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 30', 'EU 34', 'EU 36']),
      ],
    ),
    ProductModel(
      id: '012',
      stock: 15,
      price: 499,
      isFeatured: true,
      title: 'Air jordan black shoes',
      description:
          'This is a product description for track suit , there we can added more thing ',
      productType: 'ProductType.variable',
      thumbnail: AppImages.productImage7,
      brand: BrandModel(
          id: '1',
          image: AppImages.jordanLogo,
          name: 'Air Jordan',
          productCount: 140,
          isFeatured: true),
      images: [
        AppImages.productImage7,
        AppImages.productImage8,
        AppImages.productImage9,
      ],
      salePrice: 378,
      sku: 'ABD4350',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stack: 34,
          price: 499,
          salePrice: 378,
          image: AppImages.productImage7,
          description: 'This is the product description for track suit',
          attributeValue: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stack: 24,
          price: 376,
          salePrice: 299.5,
          image: AppImages.productImage8,
          description: 'This is the product description track suit',
          attributeValue: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stack: 342,
          price: 389,
          salePrice: 325.9,
          image: AppImages.productImage9,
          attributeValue: {'Color': 'Black', 'Size': 'EU 30'},
        ),
        // ProductVariationModel(
        //   id: '4',
        //   stack: 126,
        //   price: 134,
        //   salePrice: 122.6,
        //   image: AppImages.productImage7,
        //   description: 'This is the product description for nike sports shoes',
        //   attributeValue: {'Color': 'Blue', 'Size': 'EU 34'},
        // ),
      ],
    ),
    ProductModel(
      id: '013',
      stock: 15,
      price: 450,
      isFeatured: true,
      title: 'Acer laptop',
      description:
          'This is a product description for Acer laptop , there we can added more thing ',
      productType: 'ProductType.variable',
      thumbnail: AppImages.productImage47,
      brand: BrandModel(
          id: '3',
          image: AppImages.acerlogo,
          name: 'Acer',
          productCount: 140,
          isFeatured: true),
      images: [
        AppImages.productImage48,
        AppImages.productImage49,
        AppImages.productImage50,
      ],
      salePrice: 398,
      sku: 'ABD4350',
      categoryId: '3',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stack: 34,
          price: 450,
          salePrice: 398,
          image: AppImages.productImage47,
          description: 'This is the product description for track suit',
          attributeValue: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stack: 24,
          price: 659,
          salePrice: 599.0,
          image: AppImages.productImage48,
          description: 'This is the product description track suit',
          attributeValue: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stack: 342,
          price: 578,
          salePrice: 529.0,
          image: AppImages.productImage49,
          attributeValue: {'Color': 'Black', 'Size': 'EU 30'},
        ),
        ProductVariationModel(
          id: '4',
          stack: 126,
          price: 637,
          salePrice: 599.5,
          image: AppImages.productImage50,
          description: 'This is the product description for nike sports shoes',
          attributeValue: {'Color': 'Blue', 'Size': 'EU 34'},
        ),
      ],
    ),
  ];
}
