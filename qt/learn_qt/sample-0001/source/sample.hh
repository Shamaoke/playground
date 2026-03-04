
#pragma once

#include <QTimer>

class Sample : public QObject {

  Q_OBJECT

  private:
    int interval { };
    QTimer* timer { };

    Q_SLOT void send_datagram( );
    Q_SLOT void on_qtimer_start( );

  public:
    explicit Sample(QObject* parent = nullptr);

    Q_SIGNAL void qtimer_start( );
};

