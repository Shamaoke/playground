class RichStringSpec extends Specification {

  before_each:   ( ) => { this.richString = new RichString('eeasyy') }

  inspect_spec:  ( ) => { }

  upcase_spec:   ( ) => { expect(this.richString).to_eq(new RichString('EEASYY')) }

  downcase_spec: ( ) => { expect(this.richString).to_eq(new RichString('eeasyy')) }

  reverse_spec:  ( ) => { expect(this.richString).to_eq(new RichString('yysaee')) }

  compress_spec: ( ) => { expect(this.richString).to_eq(new RichString('easy')) }
}

class RichString {
  constructor (string) { this.string = string }

  inspect:  ( ) => { `#<RichString @string=${this.string}>` }

  is_empty: ( ) => { return false }

  upcase:   ( ) => { return new RichString() }

  downcase: ( ) => { return new RichString() }

  reverse:  ( ) => { return new Richstring() }

  compress: ( ) => { return new RichString() }

  // etc...
}
