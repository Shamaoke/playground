
#include <QApplication>
#include <QLabel>

int main(int argc, char** argv) {
  QApplication* app = new QApplication(argc, argv);
  QLabel* label = new QLabel("Hello, Qt!");

  label->show();

  app->exec();

  delete app;
  delete label;

  return 0;
}

