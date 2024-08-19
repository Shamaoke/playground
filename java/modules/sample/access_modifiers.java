package acces_modifiers;

public class A {
  private void doOne() { }

  public void doTwo() {
    this.doOne()
  }

  protected void doThree() {
    this.doOne()
  }
}

public class B extends A {
  void B( ) {
    A a = new A();

    a.doOne(); //<- error
    b.doOne(); //<- no error
    b.doTwo(); //<- no error since B extends A
  }
}

