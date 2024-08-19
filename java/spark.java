
public class View {
  public String format(data) {
    return "%s\n%s\n%s\n%s\n".formatted(data);
  }
}

public class Controller {
  public String read(data) {
    return new View().format(data);
  }
}

public class Application {
  public void main() {
    Controller controller = new Controller();

    get("/:data", (request, response) -> {
      return controller.read(reques.params(":data"));
    }
  }
}

// import java.text.MessageFormat;

// get("/hello/:name", (request, response) -> {
    // return String.format("Hello: %s", request.params(":name"));

    // return MessageFormat.format("Hello: {1}", request.params(":name");

    // String[] data = { "ok!", "ok too!", "ok free!", "ok for!" };

    // return "%s\n%s\n%s\n%s\n".formatted(data);
//});

