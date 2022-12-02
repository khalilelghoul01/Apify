# Apify

Apify is a framework for **REST API** in dart. It is inspired by [express.js](http://expressjs.com/).

### Features

* Easy to use
* Easy to extend
* Use similar syntax as express.js
* Use Hooks (onRequest, onGet, onPost, onPut, onDelete)
* Support routing

### Roadmap

 this isn't a complete list, but it's a start.
 it's a list of things that I want to do, but I don't know when I will do it.

- [ ] Support path parameters

- [ ] Support query parameters

- [ ] Support body parsing

- [ ] Support middleware

- [x] Support html builder

- [ ] Support static file

- [ ] Support session

- [ ] Support log

- [ ] Support cache

- [ ] Support authorization

- [ ] Support upload

- [ ] Support download

- [ ] Support CORS

- [ ] Support rate limit

- [ ] Support error handling

- [ ] Support graceful shutdown

- [ ] Support Swagger

- [ ] Support JSON Schema

- [ ] Support OpenRPC

- [ ] Support OAuth

- [ ] Support JWT

- [ ] Support Hot Reload

- [ ] Support HttP2



### Usage

to use Apify, you need to import it first.
and then you can use it like this:


```dart
import 'package:apify/apify.dart';

void main() {
  var app = Apify();

  app.get('/', (req, res) {
    res.send('Hello World!');
  });

  app.post('/user', (req, res) {
    res.status(201).json({'name': 'John'});
  });

  app.onRequest((req, res) {
    print('onRequest');
    res.next();
  });

  app.start(3000);
  //app.start(3000, () => print('Server started on port 3000'));
}
```


### Html builder

html builder is inspired by [html_builder](https://pub.dev/packages/html_builder).



```dart

import 'package:apify/apify.dart';

void main() {
  var app = Apify();

  app.get('/', (req, res) {
    res.html(Html(
        children: [
          Head(
            children: [
              Title(
                children: [
                  Text('Hello World'),
                ],
              ),
            ],
          ),
          Body(
            children: [
              H1(
                children: [
                  Text('Hello World'),
                  Div(
                    classes: ['container'],
                    id: 'wrapper',
                    children: [
                      Text('Hello World'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
    ));
  });

  app.start(3000);
}
```

### Routing

the routing is similar to express.js


```dart
import 'package:apify/apify.dart';

void main() {
  var app = Apify();

  app.route('/docs',HttpMethod.GET, (req, res) {
    res.send('docs');
  });

  app.get('/', (req, res) {
    res.send('Hello World!');
  });

  app.post('/user', (req, res) {
    res.status(201).json({'name': 'John'});
  });

  app.put('/user', (req, res) {
    res.json({'name': 'John'});
  });

  app.delete('/user', (req, res) {
    res.json({'name': 'John'});
  });

  app.start(3000);
}
```

### Hooks

hooks are executed in the order they are added to the app if they are of the same type.

the hooks are executed before the route handler.

if you want to pass the response to the next hook, you need to call `res.next()`.

```dart

import 'package:apify/apify.dart';

void main() {
  var app = Apify();

  app.onRequest((req, res) {
    print('onRequest');
    res.next();
  });

  app.onGet((req, res) {
    print('onGet');
    res.next();
  });

  app.onPost((req, res) {
    print('onPost');
    res.next();
  });

  app.onPut((req, res) {
    print('onPut');
    res.next();
  });

  app.onDelete((req, res) {
    print('onDelete');
    res.next();
  });

  app.start(3000);
}
```