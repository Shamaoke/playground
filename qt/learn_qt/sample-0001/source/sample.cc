
#include <iostream>

#include "sample.hh"

Sample::Sample(QObject* parent) :
  QObject { parent },
  interval { 1000 },
  timer { new QTimer { this } }
{
  Sample::connect(this, &Sample::qtimer_start, this, &Sample::on_qtimer_start);
  QTimer::connect(timer, &QTimer::timeout, this, &Sample::send_datagram);
}

auto Sample::send_datagram( ) -> void { std::cout << "Datagram sent!" << "\n"; }

auto Sample::on_qtimer_start( ) -> void { timer->start(interval); }

