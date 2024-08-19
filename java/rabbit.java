
package rabbit;

public class Rabbit {
  public static void main(String ...args) {
    var data = """
               header: "<header></header>

               body: "<body></body>"

               footer: "<footer></footer>"

               template: "<html><title></title>{{{ header }}}{{{ body }}}{{{ footer }}}</html>
               """;

    System.out.format("%s", data);
  }
}

