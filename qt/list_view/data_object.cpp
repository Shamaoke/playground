
#include "data_object.h"

// DataObject::DataObject(QObject* parent) : QObject(parent) { }

// DataObject::DataObject(const QString &name, const QString &surname, QObject* parent) : QObject(parent) {
//   this->name = name;
//   this->surname = surname;
// }

DataObject::DataObject(const QString &name, const QString &surname) {
  this->name = name;
  this->surname = surname;
}

auto DataObject::getName( ) -> QString { return this->name; }
auto DataObject::getSurname( ) -> QString { return this->surname; }

