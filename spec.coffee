describe 'facile', ->
  it 'binds ids', ->
    template = '<div id="dog" />'
    data = {dog: 'woof'}
    result = facile(template, data)
    expect(result).toBe('<div id="dog">woof</div>')

  it 'binds arrays', ->
    template = '<div class="dog" />'
    data = {dog: ['woof', 'bark']}
    result = facile(template, data)
    expect(result).toBe('<div class="dog">woof</div><div class="dog">bark</div>')

  it 'binds nulls and removes element', ->
    template = '<div id="dog" />'
    data = {dog: null}
    result = facile(template, data)
    expect(result).toBe('')

  it 'binds objects', ->
    template = '<div id="dog" />'
    data = {dog: {value: 'woof', 'data-age': 3} }
    result = facile(template, data)
    expect(result).toBe('<div id="dog" data-age="3">woof</div>')
  
  it 'binds array of objects', ->
    template = '<div class="dog" />'
    data =
      dog: [
        {value: 'woof', 'data-age': 3}
        {value: 'bark', 'data-peak': 27}
      ]
    result = facile(template, data)
    expect(result).toBe('<div class="dog" data-age="3">woof</div><div class="dog" data-peak="27">bark</div>')
