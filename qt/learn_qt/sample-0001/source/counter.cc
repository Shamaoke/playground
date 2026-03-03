
#include <QCoreApplication>
#include <QDebug>

#include "counter.hh"

Counter::Counter(QObject* parent) :
  QObject { parent },
  count { 0 },
  maxCount { 5 },
  timeout { 1000 }
{
  timer = new QTimer { this };

  QTimer::connect(timer, &QTimer::timeout, this, &Counter::onQTimerTimeout);

  Counter::connect(this, &Counter::start, this, &Counter::onStart);
  Counter::connect(this, &Counter::complete, this, &Counter::onComplete);
  Counter::connect(this, &Counter::stop, this, &Counter::onStop);
}

Counter::~Counter( ) { }

void Counter::onStart( ) {
  qDebug( ) << "Counter started!";
  timer->start(timeout);
}

void Counter::onStop( ) {
  timer->stop( );
  qDebug( ) << "Counter stopped!";
  QCoreApplication::quit( );
}

void Counter::onQTimerTimeout( ) {
  count++;
  qDebug( ) << "Count:" << count;

  if (count >= maxCount) {
    Q_EMIT complete( );
  }
}

void Counter::onComplete( ) {
  qDebug( ) << "Max count reached!";
  Q_EMIT stop( );
}

