# Networking Example with Error Handling

Use the BusswordAPI class to perform network calls and the BuzzwordStore to persist the data

####AddBuzzwordViewController: 
Implement the "tappedSave" function by...

* ... creating a Buzzword through a webservice call
* ... storing the received buzzword when the webservice call succeded
* ... display the received message with an UIAlertController when the webservice call failed (case Failure).
* ... display the message "Network Error, please try again" with an UIAlertController when the webservice call failed (case NetworkError)

####ListBuzzwordViewController:

Implement the "syncBuzzwords" function by...

* ... receiving a list of buzzwords through a webservice call
* ... storing the received Buzzwords and reload the UITableView (call loadBuzzwords in ListBuzzwordViewController) when the webservice call succeeded
* ... display the received message with an UIAlertController when the webservice call failed (case Failure).
* ... display the message "Network Error, please try again" with an UIAlertController when the webservice call failed (case NetworkError)

Implement the "saveBuzzword" function by...

* ... saving a Buzzword through a webservice call 
* ... storing the buzzword locally and reload the UITableView (call loadBuzzwords in ListBuzzwordViewController) when the webservice call succeeded
* ... display the received message with an UIAlertController when the webservice call failed (case Failure).
* ... display the message "Network Error, please try again" with an UIAlertController when the webservice call failed (case NetworkError)

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

## Inputs
- [Enums](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Enumerations.html)
- [UIAlertController](http://zappdesigntemplates.com/uialertcontroller-ios-8-uialertview-in-swift/)
