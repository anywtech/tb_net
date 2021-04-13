import 'package:flutter/material.dart';
import 'package:tb_net/utils/routers.dart';
import 'package:tb_net/widgets/footer.dart';
import 'package:tb_net/widgets/input_text.dart';

class NotificationMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RouterPages.NotificationMessages),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.orange,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              InputText(
                suffixIcon: Icons.search,
                enabledBorderColor: Colors.transparent,
                focusedBorderColors: Colors.transparent,
              ),
              Divider(
                height: 1,
                color: Colors.grey.withOpacity(0.1),
              ),
              ChatChanelCard(),
              Divider(
                height: 1,
                color: Colors.grey.withOpacity(0.1),
              ),
              ChatChanelCard(),
              Divider(
                height: 1,
                color: Colors.grey.withOpacity(0.1),
              ),
              ChatChanelCard(),
              Divider(
                height: 1,
                color: Colors.grey.withOpacity(0.1),
              ),
              ChatChanelCard(),
              Divider(
                height: 1,
                color: Colors.grey.withOpacity(0.1),
              ),
              ChatChanelCard(),
              Divider(
                height: 1,
                color: Colors.grey.withOpacity(0.1),
              ),
              ChatChanelCard(),
              Divider(
                height: 1,
                color: Colors.grey.withOpacity(0.1),
              ),
              ChatChanelCard(),
              Divider(
                height: 1,
                color: Colors.grey.withOpacity(0.1),
              ),
              ChatChanelCard(),
              Divider(
                height: 1,
                color: Colors.grey.withOpacity(0.1),
              ),
              ChatChanelCard(),
              Divider(
                height: 1,
                color: Colors.grey.withOpacity(0.1),
              ),
              ChatChanelCard(),
              Divider(
                height: 1,
                color: Colors.grey.withOpacity(0.1),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatChanelCard extends StatelessWidget {
  const ChatChanelCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(clipBehavior: Clip.none, children: [
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.orange,
            image: DecorationImage(
              image: NetworkImage(
                "https://i.ytimg.com/vi/asgelWh4cZw/maxresdefault.jpg",
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Positioned(
          top: -3,
          right: -3,
          child: CircleAvatar(
            radius: 3.0,
            backgroundColor: Colors.red,
          ),
        )
      ]),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ALIZII TeamALIZII TeamALIZII TeamALIZII TeamALIZII Team'.length >
                    20
                ? 'ALIZII TeamALIZII TeamALIZII TeamALIZII TeamALIZII Team'
                    .substring(0, 20)
                : 'ALIZII Team',
          ),

          Text(
            '5 mins ago',
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ), //current time - created time
        ],
      ),
      subtitle: Text(
        'New promotion is starting, come to get it and do not lost the change',
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
