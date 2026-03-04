
#include <QCoreApplication>
#include <QDebug>
#include <QObject>
#include <QTimer>

class Sample : public QObject {

  Q_OBJECT

  private:
    QTimer* timer { };
    int counter { };
    const int interval { };
    const int shots { };

    Q_SLOT void on_start( ) const { timer->start(interval); }

    Q_SLOT void on_qtimer_timeout( ) {
      if (counter >= shots)
        Q_EMIT this->stop( );
      else
        qInfo( ) << "Tick" << ++counter;
    }

    Q_SLOT void on_stop( ) {
      qInfo( ) << "Bye!";
      QCoreApplication::exit( );
    }

  public:
    explicit Sample(QObject* parent = nullptr) :
      QObject { parent },
      timer { new QTimer { this } },
      counter { 0 },
      interval { 1000 },
      shots { 5 }
    {
      Sample::connect(this, &Sample::start, this, &Sample::on_start);
      QTimer::connect(timer, &QTimer::timeout, this, &Sample::on_qtimer_timeout);
      Sample::connect(this, &Sample::stop, this, &Sample::on_stop);
    }

    Q_SIGNAL void start( );
    Q_SIGNAL void stop( );
};

auto main(int argc, char** argv) -> int {

  auto app { QCoreApplication { argc, argv } };

  auto sample { new Sample { } };

  Q_EMIT sample->start( );

  auto result { app.exec( ) };

  return result;
}

/// Qt uses the Meta-Object Compiler (MOC) to generate special code for classes
/// with `Q_OBJECT` macro. When you use `Q_OBJECT` in a `.cpp` file (not `.h`),
/// Qt automatically generates the `.moc` file, but expects you to manually include it.
/// The `.moc` file should be included at the end of a `.cpp` file, otherwise,
/// the code won't be compiled. That is, because it reads identifiers, which
/// should be firstly defined in the `.cpp` file.
///
/// The `.moc` file will be generated in the `*_autogen/include/` directory which
/// is located in the build directory.
#include "main.moc"

