Invisichar
==========
Convert to and from Invisible Characters (for click tracking as described [here](http://kaspars.net/blog/web-development/invisible-click-tracking))

Usage
-----

```
invisichar = require('invisichar');

invisible = invisichar.fromString("utm_source=twitter");
console.log(invisible); // nada
console.log(invisible.length); // 72
console.log(invisichar.toString(invisible)); // utm_source=twitter
```
