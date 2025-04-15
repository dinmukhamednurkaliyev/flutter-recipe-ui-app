import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_recipe_ui_app/models/recipe.dart';

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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
