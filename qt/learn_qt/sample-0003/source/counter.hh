
#pragma once

#include <QObject>
#include <QTimer>

class Counter : public QObject {

  Q_OBJECT

  private:
    QTimer* timer { };
    int count { };
    const int maxCount { };
    const int timeout { };

    Q_SLOT void onStart( );
    Q_SLOT void onQTimerTimeout( );
    Q_SLOT void onComplete( );
    Q_SLOT void onStop( );

    Q_SIGNAL void complete( );
    Q_SIGNAL void stop( );

  public:
    explicit Counter(QObject* parent = nullptr);
    ~Counter( );

    Q_SIGNAL void start( );
};

