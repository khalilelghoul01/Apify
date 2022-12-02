import 'package:http_server/apify.dart';
import 'package:http_server/dom/dom.dart';

Future<void> main(List<String> arguments) async {
  var app = ApiFy();

  app.get('/test', (Request req, Response res) {
    res.status(201).json({
      'message': 'Hello World',
    });
  });

  app.post('/post', (req, res) {
    res.status(200).json({
      'message': 'Hello World',
    });
  });
  app.get('/', (Request req, Response res) {
    res.status(200).html(Html(
          children: [
            Body(
              children: [
                H1(text: 'this is a title'),
                H3(text: 'this is a subtitle'),
                Div(classes: [
                  "container"
                ], children: [
                  P(text: "this is a paragraph"),
                  Div(classes: [
                    "container"
                  ], children: [
                    Img(
                        src:
                            "https://files.muzli.space/23189feda8ff61f4db1bc027afcbbe63.jpeg",
                        alt: "this is an image",
                        width: 500,
                        height: 500),
                  ])
                ]),
              ],
            ),
          ],
        ).toString());
  });

  app.onRequest((req, res) {
    print("onRequest");
    res.next();
  });

  app.onGet((req, res) {
    print("onGet");
    res.next();
  });

  app.onPost((req, res) {
    print("onPost");
    res.next();
  });

  app.start(2000, callback: () {
    print('Server started on port 2000');
  });
}
