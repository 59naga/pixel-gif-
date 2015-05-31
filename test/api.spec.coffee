# Dependencies
pixelGif= require '../src'
fixture= require 'fixture-images'

# Environment
jasmine.DEFAULT_TIMEOUT_INTERVAL= 3000

# Specs
describe 'pixel-gif',->
  describe '.parse',->
    it 'animated',(done)->
      file= fixture.path.animated.gif

      pixelGif.parse file
      .then (images)->
        expect(images.loopCount).toBe 0
        
        image= images[0]
        expect(image.width).toBe 73
        expect(image.height).toBe 73
        expect(image.data.length).toBe image.width*image.height*4

        done()

    it 'static',(done)->
      file= fixture.path.still.gif

      pixelGif.parse file
      .then (images)->
        expect(images.loopCount).toBe -1

        image= images[0]
        expect(image.width).toBe 112
        expect(image.height).toBe 112
        expect(image.data.length).toBe image.width*image.height*4

        done()