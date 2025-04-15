import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_recipe_ui_app/models/ingredients.dart';
import 'package:flutter_recipe_ui_app/models/recipe.dart';
import 'package:flutter_recipe_ui_app/widgets/section_title.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

/// A page that displays the details of items.
class ItemsDetailsPage extends StatefulWidget {
  /// Creates a new instance of [ItemsDetailsPage].
  const ItemsDetailsPage({required this.recipeItems, super.key});

  /// The recipe items to be displayed on this page.
  final RecipeItems recipeItems;

  @override
  State<ItemsDetailsPage> createState() => _ItemsDetailsPageState();
}

class _ItemsDetailsPageState extends State<ItemsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.55,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.recipeItems.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: CircleAvatar(
                backgroundColor: Colors.black38,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: size.height * 0.5,
                width: size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundImage: NetworkImage(
                              widget.recipeItems.woner,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.recipeItems.wonerName,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    height: 0,
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  '12 Recipes Shared',
                                  style: TextStyle(
                                    height: 0,
                                    fontSize: 12,
                                    color: Color.fromRGBO(0, 0, 0, 0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${widget.recipeItems.rate}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  RatingBar.builder(
                                    itemSize: 15,
                                    initialRating: widget.recipeItems.rate,
                                    unratedColor: Colors.grey.shade400,
                                    itemBuilder:
                                        (context, index) => const Icon(
                                          Icons.star,
                                          color: Colors.amberAccent,
                                        ),
                                    onRatingUpdate: (value) {},
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${widget.recipeItems.reviews} Reviews',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(0, 0, 0, 0.6),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                widget.recipeItems.name,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '1 Bowl (${widget.recipeItems.weight}g)',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            'See details',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyProgressIndicatorValue(
                            name: 'Carbs',
                            amount: '${widget.recipeItems.carb} g',
                            percentage: '(56%)',
                            color: Colors.green,
                            data: 0.4,
                          ),
                          MyProgressIndicatorValue(
                            name: 'Fat',
                            amount: '${widget.recipeItems.fat} g',
                            percentage: '(72%)',
                            color: Colors.red,
                            data: 0.6,
                          ),
                          MyProgressIndicatorValue(
                            name: 'Protein',
                            amount: '${widget.recipeItems.protein} g',
                            percentage: '(8%)',
                            color: Colors.orange,
                            data: 0.2,
                          ),
                          MyProgressIndicatorValue(
                            color: Colors.green,
                            name: 'Calories',
                            amount: '${widget.recipeItems.calorie} kkal',
                            percentage: '',
                            data: 0.7,
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      const SectionTitle(title: 'Ingredients'),
                      const SizedBox(height: 20),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            ingredients.length,
                            (index) => Padding(
                              padding:
                                  index == 0
                                      ? const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                      )
                                      : const EdgeInsets.only(right: 20),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 33,
                                    backgroundColor: ingredients[index].color,
                                    child: Image.asset(
                                      ingredients[index].image,
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    ingredients[index].name,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Positioned(
              bottom: size.height * 0.5,
              child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(color: Colors.white),
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.48,
              right: 30,
              child: Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(238, 238, 238, 1),
                      spreadRadius: 5,
                    ),
                  ],
                  color: widget.recipeItems.fav ? Colors.red : Colors.black45,
                ),
                child: const Icon(Iconsax.heart, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A widget that displays a circular progress indicator with a name, amount, and percentage.
class MyProgressIndicatorValue extends StatelessWidget {
  /// Creates a new instance of [MyProgressIndicatorValue].
  const MyProgressIndicatorValue({
    required this.name,
    required this.amount,
    required this.percentage,
    required this.color,
    required this.data,
    super.key,
  });

  /// The name of the item.
  final String? name;

  /// The amount of the item.
  final String? amount;

  /// The percentage of the item.
  final String percentage;

  /// The color of the item.
  final Color color;

  /// The data value of the item.
  final double data;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 20,
      circularStrokeCap: CircularStrokeCap.round,
      percent: data,
      lineWidth: 7,
      reverse: true,
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.2),
      animation: true,
      restartAnimation: true,
      progressColor: color,
      header: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(
          name!,
          style: const TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.6),
            fontSize: 12,
          ),
        ),
      ),
      footer: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '$amount ',
                style: const TextStyle(color: Colors.black, fontSize: 12),
              ),
              TextSpan(
                text: percentage,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A custom clipper that creates a specific path for the widget.
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path =
        Path()
          ..lineTo(0, size.height)
          ..lineTo(size.width, size.height)
          ..quadraticBezierTo(0, size.height, 0, 0)
          ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
