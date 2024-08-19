let Button    = javafx.scene.control.Button
let StackPane = javafx.scene.layout.StackPane
let Scene     = javafx.scene.Scene

function start (primaryStage)
  { let button          = new Button()
        button.text     = "Say 'Hello World'"
        button.onAction = function() { print('Hello World!') }

    let root = new StackPane()

        root.children.add(button)

    primaryStage.title = 'Hello World!'
    primaryStage.scene = new Scene(root, 300, 250)

    primaryStage.show() }

function start (primaryStage)
  { new Button
      ( b => { b.text     = 'Say \'Hello world!\''
               b.onAction = () => print('Hello world!') } ) }

function start (primaryStage) {
  new Button(b => {
    b.text     = 'Say \'Hello world!\''
    b.onAction = () => print('Hello world!')

    new StackPane(sp => {
      sp.children.add(b)

      primaryStage.title = 'Hello world!'
      primaryStage.scene = new Scene(sp, 300, 250)

      primaryStage.show()
    })
  })
}
