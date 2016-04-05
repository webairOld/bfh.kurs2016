# Networking Example
Implement the WebBuzzwordStore, so that the data gets displayed. Use the Unit Tests to guide you through the implementation (WebBuzzwordStoreTest.swift). For simplicity use 'try!' if you need to catch errors and ignore http errors.

## Webservice Specs

### List Buzzwords

####Request:

GET - https://buzzword.com/buzzwords


####Response:

```javascript
[{
"id" : 1,
"name" : "Apple",
"count" : 0
},
{
"id" : 2,
"name" : "Google",
"count" : 1
}
]
```

### Create Buzzword

####Request:

POST - https://buzzword.com/buzzwords

Body:

```javascript
{
"name" : "Apple"
}
```


####Response:

```javascript
{
"id" : 1,
"name" : "Apple",
"count" : 0
}
]
```

### Update Buzzword

####Request:

POST - https://buzzword.com/buzzwords/1/

Body:

```javascript
{
"id" : 1,
"name" : "Apple",
"count" : 2
}
```


####Response:

```javascript
<empty>
```

## Keywords
- Closures
- ErrorType / try
- NSURLSession / NSURLSessionDataTask
- JSON / NSJSONSerialization


## Inputs
- [Closures](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html#//apple_ref/doc/uid/TP40014097-CH11-ID94)
- [Error Handling](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ErrorHandling.html#//apple_ref/doc/uid/TP40014097-CH42-ID508)
- [Download and Read JSON](http://www.learnswiftonline.com/mini-tutorials/how-to-download-and-read-json/)