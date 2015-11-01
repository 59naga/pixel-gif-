# Dependencies
PixelUtil= (require 'pixel-util').PixelUtil
GifReader= (require 'omggif').GifReader

class PixelGif extends PixelUtil
  parse: (file)->
    @createBuffer file
    .then (buffer)=>
      reader= new GifReader new Uint8Array buffer

      images=
        for i in [0...reader.numFrames()]

          image= @createImageData reader.width,reader.height
          image[key]= value for key,value of reader.frameInfo i
          image.delay= image.delay*10 if image.delay # bugfix
          reader.decodeAndBlitFrameRGBA i,image.data

          image

      images.loopCount= reader.loopCount()
      images.loopCount?= -1
      images

module.exports= new PixelGif
module.exports.PixelGif= PixelGif
