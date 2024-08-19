[

  { href: 'one', tags: 'a, b, c' },
  { href: 'two', tags: 'b, w, a' },
  { href: 'one', tags: 'a, b, e' },
  { href: 'three', tags: 'a, b'  },
  { href: 'one', tags: 'a, b, e' },
  { href: 'one', tags: 'a, b, e' },
  { href: 'one', tags: 'a, b, e' },
  { href: 'one', tags: 'a, b, e' },
  { href: 'two', tags: 'a, b'  },
  { href: 'two', tags: 'a, b'  }

] => bmarks

bmarks.then do |a|
  p a.uniq { |e| e.fetch :href }
end

