#
# A sample from the book 'LNCS 8858 — Programming languages and systems', p. 78
#

def foo x
  print "E#{x} "

  if x >= 5 then yield
  else foo(x + 1) { print "B#{x} "; x <= 2 ? break : yield }
  end

  print "L#{x} "
end

