import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Chef's Hub"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 220.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  List<String> imagePaths = [
                    "assets/review.png",
                    "assets/organizer.png",
                    "assets/esential.png",
                  ];
                  List<String> titles = [
                    'Explore Food review',
                    'Explore Organizing',
                    'Explore Essential',
                  ];
                  List<String> descriptions = [
                    'Appraise thousands of restaurants',
                    'Consistency is crucial in the kitchen',
                    'Feedly curates relevant news articles',
                  ];
                  List<Color> backcolors = [
                    const Color(0xFFFFF0D0),
                    const Color(0xFFE7E7E7),
                    const Color(0xFFC8E4F7),
                  ];
                  return ProductCard(
                    title: titles[index],
                    description: descriptions[index],
                    imagePath: imagePaths[index],
                    backcolor: backcolors[index],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Featured Categories',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Image.network(
                            'https://www.treebo.com/blog/wp-content/uploads/2018/04/Early-Morning-Breakfast-in-Delhi-.jpg',
                            fit: BoxFit.cover),
                        ListTile(
                          title: Text('Breakfast'),
                          subtitle: Text('First meal of the day usually eaten'),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Image.network(
                            'https://i.etsystatic.com/26797273/r/il/d218e3/2982125915/il_1588xN.2982125915_e0wq.jpg',
                            fit: BoxFit.cover),
                        ListTile(
                          title: Text('Lucnh'),
                          subtitle:
                              Text('Meal eaten around the middle of the day'),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Image.network(
                            'https://bpb-us-e1.wpmucdn.com/sites.psu.edu/dist/2/59626/files/2016/11/turkey-dinner-2g2r1uq.jpg',
                            fit: BoxFit.cover),
                        ListTile(
                          title: Text('Dinner '),
                          subtitle:
                              Text('Meal eaten around the middle of the day'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Dive our Features',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Image.network(
                        'https://www.tasteofhome.com/wp-content/uploads/2019/06/meal-prepshutterstock_1217679244.jpg'),
                    ListTile(
                      title: Text('Meal Plans: A Guide to Healthy Eating'),
                      subtitle: Text(
                          'Meal plans are a great way to eat healthy, save time and money, and enjoy a variety of dishes.'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Image.network(
                        'https://ruscioinstitute.com/wp-content/uploads/2021/01/image2-1536x864.png'),
                    ListTile(
                      title: Text('Plan Emphasizes Whole'),
                      subtitle: Text(
                          'Healthy and balanced meal plan with recipes and prep ideas'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Image.network(
                        'https://www.tasteofhome.com/wp-content/uploads/2019/03/instant-pot.jpg'),
                    ListTile(
                      title: Text('Best Stock Alert Services'),
                      subtitle: Text(
                          'This platform allows you to create alerts based on various asset needs'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final Color backcolor;

  ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.backcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Card(
        color: backcolor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          width: 320.0,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        title,
                        style:
                            const TextStyle(fontSize: 12.0, color: Colors.grey),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(253, 245, 135, 62),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Browse',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(2),
                child: Image.asset(
                  imagePath,
                  width: 150,
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
