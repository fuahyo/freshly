part of 'screens.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> images = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    // 'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    // 'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0.0,
        //   backgroundColor: kPrimaryColor,
        //   shadowColor: Colors.transparent,
        //   iconTheme: const IconThemeData(color: colorName.black),
        // ),

        bottomNavigationBar: BlocBuilder<DetailProductBloc, DetailProductState>(
      builder: (context, state) {
        if (state is DetailProductIsSuccess) {
          return BlocConsumer<AddToCartBloc, AddToCartState>(
            listener: (context, addToCartState) {
              if (addToCartState is AddToCartIsSuccess) {
                Commons().showSnackbarInfo(context, addToCartState.message);
              }
              if (addToCartState is AddToCartIsFailed) {
                Commons().showSnackbarError(context, addToCartState.message);
              }
            },
            builder: (context, addToCartState) {
              return BlocBuilder<CheckVariantCubit, CheckVariantState>(
                builder: (context, variantState) {
                  return Stack(children: [
                    Container(
                      height: 90,
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, right: 30, left: 30),
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          10.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.green.shade800,
                                      blurRadius: 9,
                                      blurStyle: BlurStyle.outer,
                                    )
                                  ],
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: IconButton(
                                    onPressed: () {
                                      BlocProvider.of<AddToCartBloc>(context)
                                          .add(AddToCart(
                                              state.data,
                                              (variantState
                                                      as CheckVariantIsSelected)
                                                  .selectedVariant));
                                    },
                                    icon: Icon(Icons.shopping_cart_checkout)),
                              ),
                              12.widthBox,
                              ButtonWidget(
                                text: 'Buy Now',
                                color: kPrimaryColor,
                                isLoading: false,
                                onPressed: () async {
                                  // BlocProvider.of<AddToCartBloc>(context).add(
                                  //   AddToCart(
                                  //     //untuk data
                                  //     state.data,
                                  //     //untuk variant yang dipilih
                                  //     (variantState as CheckVariantIsSelected)
                                  //         .selectedVariant,
                                  //   ),
                                  // );
                                  context.go(routeName.cartPath);
                                },
                              ).expand(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]);
                },
              );
            },
          );
        }
        return 0.heightBox;
      },
    ),

        //     bottomNavigationBar: BlocBuilder<DetailProductBloc, DetailProductState>(
        //   builder: (context, state) {
        //     if (state is DetailProductIsSuccess) {
        //       return BlocConsumer<AddToCartBloc, AddToCartState>(
        //         listener: (context, addToCartState) {
        //           if (addToCartState is AddToCartIsSuccess) {
        //             Commons().showSnackbarInfo(context, addToCartState.message);
        //           }
        //           if (addToCartState is AddToCartIsFailed) {
        //             Commons().showSnackbarError(context, addToCartState.message);
        //           }
        //         },
        //         builder: (context, addToCartState) {
        //           return BlocBuilder<CheckVariantCubit, CheckVariantState>(
        //             builder: (context, variantState) {
        //               return Stack(children: [
        //                 Container(
        //                   height: 170,
        //                   padding: EdgeInsets.only(
        //                       top: 10, bottom: 10, right: 30, left: 30),
        //                   decoration: BoxDecoration(
        //                     color: kPrimaryColor.withOpacity(0.2),
        //                     borderRadius: BorderRadius.only(
        //                         topLeft: Radius.circular(50),
        //                         topRight: Radius.circular(50)),
        //                   ),
        //                   child: Column(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Row(
        //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                         children: [
        //                           "Total KG".text.size(16).makeCentered(),
        //                           "Total Harga".text.size(16).makeCentered(),
        //                         ],
        //                       ),
        //                       Row(
        //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                         children: [
        //                           BlocBuilder<CounterCubit, CounterState>(
        //                             builder: (context, counterState) {
        //                               if (counterState is CounterFilled) {
        //                                 return "${counterState.val} KG"
        //                                     .text
        //                                     .size(28)
        //                                     .bold
        //                                     .make();
        //                               }
        //                               return Container();
        //                             },
        //                           ),
        //                           BlocBuilder<CounterCubit, CounterState>(
        //                             builder: (context, counterState) {
        //                               if (counterState is CounterFilled) {
        //                                 return Commons()
        //                                     .setPriceToIDR(state.data.price! *
        //                                         counterState.val)
        //                                     .text
        //                                     .size(28)
        //                                     .bold
        //                                     .make();
        //                               }
        //                               return Row(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.spaceBetween,
        //                                 children: [
        //                                   // "1 KG".text.size(28).bold.make(),
        //                                   Commons()
        //                                       .setPriceToIDR(state.data.price!)
        //                                       .text
        //                                       .size(28)
        //                                       .bold
        //                                       .make(),
        //                                 ],
        //                               );
        //                             },
        //                           ),
        //                         ],
        //                       ),
        //                       20.heightBox,
        //                       Row(
        //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                         crossAxisAlignment: CrossAxisAlignment.end,
        //                         children: [
        //                           ButtonWidget(
        //                             text: "-",
        //                             color: kPrimaryColor,
        //                             onPressed: () {
        //                               BlocProvider.of<CounterCubit>(context)
        //                                   .counterIncrement(-1);
        //                             },
        //                           ),
        //                           ButtonWidget(
        //                             text: 'Add To Cart',
        //                             color: kPrimaryColor,
        //                             isLoading:
        //                                 (addToCartState is AddToCartIsLoading),
        //                             onPressed: () {
        //                               BlocProvider.of<AddToCartBloc>(context).add(
        //                                 AddToCart(
        //                                   //untuk data
        //                                   state.data,
        //                                   //untuk variant yang dipilih
        //                                   (variantState as CheckVariantIsSelected)
        //                                       .selectedVariant,
        //                                 ),
        //                               );
        //                             },
        //                           ),
        //                           ButtonWidget(
        //                             text: "+",
        //                             color: kPrimaryColor,
        //                             onPressed: () {
        //                               BlocProvider.of<CounterCubit>(context)
        //                                   .counterIncrement(1);
        //                               // print(state.data.pictures);
        //                             },
        //                           ),
        //                         ],
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ]);
        //             },
        //           );
        //         },
        //       );
        //     }
        //     return 0.heightBox;
        //   },
        // ),

        body: SafeArea(
      child: BlocBuilder<DetailProductBloc, DetailProductState>(
        builder: (context, state) {
          if (state is DetailProductIsSuccess) {
            return VStack([
              _buildListImage2(context, state, _controller, _current),
              _buildProductDetails(state),
            ]).scrollVertical();
          }
          return Container();
        },
      ),
    ));
  }

  Widget _buildProductDetails(DetailProductIsSuccess state) {
    return VStack([
      HStack([
        VStack([
          state.data.name!.text.size(20).semiBold.make(),
          8.heightBox,
          Row(
            children: [
              "Harga Per Kilo".text.size(20).make(),
              8.widthBox,
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: kPrimaryColor),
                child: Commons()
                    .setPriceToIDR(state.data.price!)
                    .text
                    .size(20)
                    .bold
                    .make(),
              ),
            ],
          ),
        ]).expand(),
        BlocListener<WishlistCubit, WishlistState>(
          listener: (context, wishlistState) {
            if (wishlistState is WishlistIsSuccess) {
              Commons().showSnackbarInfo(context, wishlistState.message);
            }
            if (wishlistState is WishlistIsFailed) {
              Commons().showSnackBar(context, wishlistState.message);
            }
          },
          child: BlocBuilder<CheckSavedCubit, CheckSavedState>(
            builder: (context, checkSavedState) {
              if (checkSavedState is CheckSavedIsSuccess) {
                return IconButton(
                    onPressed: () {
                      BlocProvider.of<WishlistCubit>(context)
                          .removeFromWishList(state.data.id!);
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: colorName.accentRed,
                    ));
              }
              return IconButton(
                  onPressed: () {
                    BlocProvider.of<WishlistCubit>(context)
                        .addToWishList(state.data);
                  },
                  icon: const Icon(Icons.favorite_border_rounded));
            },
          ),
        )
      ]),
      VStack([
        'Rating'.text.size(16).bold.make(),
        Row(
          children: [
            Icon(
              Icons.star,
              color: kPrimaryColor,
              size: 30,
            ),
            Icon(Icons.star, size: 30, color: kPrimaryColor),
            Icon(Icons.star, size: 30, color: kPrimaryColor),
            const Icon(Icons.star, size: 30, color: Colors.black),
            const Icon(Icons.star, size: 30, color: Colors.black),
          ],
        ),
        'Deskripsi'.text.size(16).bold.make(),
        4.heightBox,
        state.data.desc!.text.size(14).color(colorName.grey).make(),
      ]).py16(),
      VStack([
        'Variant Produk'.text.bold.make(),
        8.heightBox,
        BlocBuilder<CheckVariantCubit, CheckVariantState>(
          builder: (context, variantState) {
            return HStack(state.data.variant!
                .map((e) => VxBox(
                            child: e.text
                                .color((variantState as CheckVariantIsSelected)
                                        .selectedVariant
                                        .contains(e)
                                    ? colorName.white
                                    : colorName.black)
                                .make())
                        .color(variantState.selectedVariant.contains(e)
                            ? kPrimaryColor
                            : colorName.white)
                        .border(
                            color: variantState.selectedVariant.contains(e)
                                ? colorName.white
                                : colorName.grey)
                        .p16
                        .rounded
                        .make()
                        .onTap(() {
                      BlocProvider.of<CheckVariantCubit>(context).selectItem(e);
                    }).pOnly(right: 4))
                .toList());
          },
        )
      ]),
      // BlocBuilder<CounterCubit, CounterState>(
      //   builder: (context, state) {
      //     return VStack([
      //       'Total'.text.size(16).bold.make(),
      //       4.heightBox,
      //       ((state is CounterFilled) ? "${state.val} KG" : "1 KG").text.make(),
      //     ]);
      //   },
      // ).py16(),
    ]).p16();
  }

  Widget _buildListImage2(
      context, DetailProductIsSuccess state, curent, controller) {
    // int _current = 0;
    // final CarouselController _controller = CarouselController();
    return Stack(
      children: [
        Container(
          child: Column(
            children: [
              CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  scrollDirection: Axis.vertical,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                  aspectRatio: 1.4,
                  enlargeCenterPage: true,
                ),
                items: state.data.pictures!
                    .map(
                      (e) => Container(
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Stack(
                              children: [
                                Image(
                                  image: NetworkImage(e),
                                  fit: BoxFit.contain,
                                  width: 1000,
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    child: Text(
                                      "${state.data.name}",
                                      style: TextStyle(
                                          color: kPrimaryColor, fontSize: 13),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : kPrimaryColor)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            child: CircleAvatar(
              backgroundColor: kPrimaryColor,
              radius: 25,
              child: Icon(Icons.arrow_back_ios, color: Colors.white),
            ).onTap(() {
              Navigator.pop(context);
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildListImage(context, DetailProductIsSuccess state) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40), color: Colors.amber),
          child: VxSwiper.builder(
            itemCount: state.data.pictures!.length,
            autoPlay: true,
            aspectRatio: 16 / 11,
            initialPage: 0,
            itemBuilder: (context, index) {
              return AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  state.data.pictures![index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            child: CircleAvatar(
              backgroundColor: kPrimaryColor,
              radius: 25,
              child: Icon(Icons.arrow_back_ios, color: Colors.white),
            ).onTap(() {
              Navigator.pop(context);
            }),
          ),
        ),
      ],
    );
  }
}
