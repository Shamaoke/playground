public abstract class List<A> implements Iterable<A> {

  /**
   * Returns <code>true</code> if this list is empty, <code>false</code> otherwise.
   *
   * @return <code>true</code> if this list is empty, <code>false</code> otherwise.
   */
  public final boolean isEmpty() {
    return this instanceof Nil;
  }

  /**
   * Returns <code>true</code> if this list is not empty, <code>false</code> otherwise.
   *
   * @return <code>true</code> if this list is not empty, <code>false</code> otherwise.
   */
  public final boolean isNotEmpty() {
    return !(this instanceof Nil);
  }

  public final A foldLeft (final F2<A, A, A> f, final B b) {
    B x = b;

    for (List<A> this; xs.isNotEmpty(); xs = xs.tail())
      x = f.f(x, xs.head());

    return x;
  }
}
