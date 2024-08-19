let rgb_component = {
  Red:   function (n) { this._red   = ['r', n] },
  Green: function (n) { this._green = ['g', n] },
  Blue:  function (n) { this._blue  = ['b', n] },
}

let rgb_color = {
  RGB_Color: function(r, g, b) { this._color = [r, g, b] }
}

let gpl_color = {
  GPL_Color: function(name, color) { this._gpl_color = [name, color] }
}

let palette = {
  Palette: function(gpl_colors) { this._palette = gpl_colors }
}

let SchemeCreator = {
  gpl:        'palette.gpl',
  name:       slice(gpl, /^Name: (.*)$/, 1),
  content:    slice(gpl, /.*#\n(.*)\n/m, 1),
  rows:       split(this.content, "\n"),
  rows_ary:   map(rows, r => split(r, "\t"),
  colors:     map(split(rows_ary[0], ' '), c => to_i(c)),
  gpl_colors: map( rows_ary, r => new gpl_color.GPL_Color(r[1], (new rgb_color.RGB_Color( new rgb_component.Red(colors[0]),
                                                                                          new rgb_component.Green(colors[1]),
                                                                                          new rgb_component.Blue(colors[2]) )))) ),
  palette:   new palette.Palette(gpl_colors),

  build_shemes: function (templates) {
    /* code to open templates
       and inject this.name, this.palette[color]
       into them */
  }

  main: function( ) {
    this.build_shemes(['colorschems.conf', 'themerc'])
  }
}
