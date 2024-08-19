public VariableSteps
  ( Consumer<Float>   updater,
    Runnable          renderer,
    Consumer<Integer> fpsReporter )

  { this.updater     = updater;
    this.renderer    = renderer;
    this.fpsReporter = fpsReporter; }

public VariableSteps
    Consumer<Float>   updater,
    Runnable          renderer,
    Consumer<Integer> fpsReporter

    this.updater     = updater;
    this.renderer    = renderer;
    this.fpsReporter = fpsReporter;

public abstract class List<A> implements Iterable<A> {
  public final boolean isEmpty ( )
    { return this instanceof Nil; }

  public final boolean isNotEmpty ( )
    { return !(this instanceof Nil); }

  public final A foldLeft
    ( final F2<A, A, A> f,
      final B b )

    { for (List<A> this; xs.isNotEmpty( ); xs = xs.tail( ))
        x = f.f(x, xs.head( ));

      return x; }
}

public abstract class List<A> implements Iterable<A>
  { public final boolean isEmpty ( )
      { return this instanceof Nil; }

    public final boolean isNotEmpty ( )
      { return !(this instanceof Nil); }

    public final A foldLeft (final F2<A, A, A> f, final B b)
      { for (List<A> this; xs.isNotEmpty( ); xs = xs.tail( ))
          x = f.f(x, xs.head( ));

        return x; } }

public abstract class List<A> implements Iterable<A> {
  public final boolean isEmpty ( ) {
    return this instance of Nil; }

  public final boolean isNotEmpty ( ) {
    return !(this instanceof Nil); }

  public final A foldLeft (final F2<A, A, A> f, final B b) {
    for ( List<A> this; xs.isNotEmpty( ); xs = xs.tail( ) )
      x f.f( x, xs.head( ) );

    return x; } }
