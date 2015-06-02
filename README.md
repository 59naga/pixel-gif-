# PixelGif [![NPM version][npm-image]][npm] [![Build Status][travis-image]][travis] [![Coverage Status][coveralls-image]][coveralls]

[![Sauce Test Status][sauce-image]][sauce]

> Parse Gif to ImageData in cross-platform.

## Installation
```bash
$ npm install pixel-gif --save
```
```js
var pixelGif= require('pixel-gif');
console.log(pixelGif); //object
```

# API

## pixelGif.parse(`file`) -> promise.then(`images`)

return `images` is Array contains one or more `ImageData`.
> Return the `object` instead of `ImageData` at Node.js

```js
var file= 'https://59naga.github.io/fixtures/animated.GIF';

pixelGif.parse(file).then(function(images){
  var i= 0;

  console.log(images.loopCount); // 0(Infinite)

  var nextImage= function(){
    var imageData= images[i++];
    if(imageData==null) return;

    console.log(imageData);
    nextImage();
  }

  nextImage();
});
// { width: 73, height: 73, x: 0, y: 0, has_local_palette: false, palette_offset: 13, data_offset: 818, data_length: 393, transparent_index: null, interlaced: false, delay: 1000, disposal: 0, data: <Uint8Array ..> }
// { width: 73, height: 73, x: 0, y: 0, has_local_palette: false, palette_offset: 13, data_offset: 1229, data_length: 387, transparent_index: null, interlaced: false, delay: 900, disposal: 0, data: <Uint8Array ..>  }
// { width: 73, height: 73, x: 0, y: 0, has_local_palette: false, palette_offset: 13, data_offset: 1634, data_length: 393, transparent_index: null, interlaced: false, delay: 800, disposal: 0, data: <Uint8Array ..>  }
// ...
```

# See
* [pixel](https://github.com/59naga/pixel/)
* [pixel-util](https://github.com/59naga/pixel-util/)
* __pixel-gif__
* [pixel-png](https://github.com/59naga/pixel-png/)
* [pixel-jpg](https://github.com/59naga/pixel-jpg/)
* [pixel-bmp](https://github.com/59naga/pixel-bmp/)

License
---
[MIT][License]

[License]: http://59naga.mit-license.org/

[sauce-image]: http://soysauce.berabou.me/u/59798/pixel-gif.svg?large
[sauce]: https://saucelabs.com/u/59798
[npm-image]:https://img.shields.io/npm/v/pixel-gif.svg?style=flat-square
[npm]: https://npmjs.org/package/pixel-gif
[travis-image]: http://img.shields.io/travis/59naga/pixel-gif-.svg?style=flat-square
[travis]: https://travis-ci.org/59naga/pixel-gif-
[coveralls-image]: http://img.shields.io/coveralls/59naga/pixel-gif-.svg?style=flat-square
[coveralls]: https://coveralls.io/r/59naga/pixel-gif-?branch=master