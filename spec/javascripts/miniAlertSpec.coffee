describe "miniAlert", ->

  beforeEach ->
    loadFixtures 'fragment.html'
    @$element = $('.minialert')

  it "should be available on the jQuery object", ->
    expect($.fn.miniAlert).toBeDefined()

  it "should be chainable", ->
    expect(@$element.miniAlert()).toBe(@$element)

  it "should offers default values", ->
    plugin = new $.miniAlert(@$element[0])
    expect(plugin.defaults).toBeDefined()

  it "should overwrites the settings", ->
    options = {text: 'y',  position: 'after'}
    plugin = new $.miniAlert(@$element[0], options)
    expect(plugin.settings.text).toBe(options.text)
    expect(plugin.settings.position).toBe(options.position)

  describe "button", ->

    describe "defaults options", ->
      beforeEach ->
        @$element.miniAlert()
        @$button = @$element.find 'button'

      it "should add a button to the alert", ->
        expect(@$button).toExist()

      it "should prepend the button to the alert if position is default", ->
        expect(@$button.next('p')).toExist()
        expect(@$button.prev('p')).not.toExist()

      it "should add a button with 'x' as content", ->
        expect(@$button).toHaveText 'x'

      it "should add a button with 'close' class", ->
        expect(@$button).toHaveClass 'close'

    describe "custom options", ->
      beforeEach ->
        @options = 
          text: 'close'
          cssClass: 'hide'
          position: 'after'

        @$element.miniAlert(@options)
        @$button = @$element.find 'button'

      it "should add a button to the alert", ->
        expect(@$button).toExist()

      it "should append the button to the alert if position is 'after", ->
        expect(@$button.prev('p')).toExist()
        expect(@$button.next('p')).not.toExist()

      it "should add a button with 'close' as content", ->
        expect(@$button).toHaveText @options.text

      it "should add a button with 'after' class", ->
        expect(@$button).toHaveClass @options.cssClass      


  describe "callbacks", ->
