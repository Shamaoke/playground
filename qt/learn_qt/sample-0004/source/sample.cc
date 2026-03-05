
#include <QCoreApplication>
#include <QDebug>
#include <QObject>

#include "sample.hh"

Sample::Sample(QObject* parent) :
  QObject { parent }
{
  qInfo( ) << "Sample was created!";
}

