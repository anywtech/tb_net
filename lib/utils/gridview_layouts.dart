import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tb_net/models/image_data.dart';
import 'package:tb_net/models/proditem_portrait_card.dart';
import 'package:tb_net/widgets/prod/prod_item_listcard.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
    @required this.data,
  }) : super(key: key);

  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: new GridTile(
            //footer: new Text(data[index]),
            child: new Text(
                data[index]), //just for testing, will fill with image later
          ),
        );
      },
    );
  }
}

class StandardGrid extends StatelessWidget {
  const StandardGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      // addAutomaticKeepAlives: true,
      itemCount: imageList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 3,
          crossAxisSpacing: 4,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.5)),
      itemBuilder: (context, index) => ImageCard(
        imageData: imageList[index],
      ),
    );
  }
}

class StandardStaggeredGrid extends StatelessWidget {
  const StandardStaggeredGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          itemCount: imageList.length,
          itemBuilder: (context, index) => ImageCard(
            imageData: imageList[index],
          ),
          staggeredTileBuilder: (index) => StaggeredTile.count(1, 1),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
      ],
    );
  }
}

class InstagramSearchGrid extends StatelessWidget {
  const InstagramSearchGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          itemCount: imageList.length,
          itemBuilder: (context, index) => ImageCard(
            imageData: imageList[index],
          ),
          staggeredTileBuilder: (index) => StaggeredTile.count(
              (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
      ],
    );
  }
}

class PinterestGrid extends StatelessWidget {
  const PinterestGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      itemCount: recommendedItems.length,
      itemBuilder: (context, index) =>
          ProdItemListCard(prodItem: recommendedItems[index]),
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      // mainAxisSpacing: 8.0,
      // crossAxisSpacing: 8.0,
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({this.imageData});

  final ImageData imageData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.network(imageData.imageUrl, fit: BoxFit.cover),
    );
  }
}
