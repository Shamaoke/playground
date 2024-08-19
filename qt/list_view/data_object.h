
#pragma once

#include <QObject>

class DataObject : public QObject {
  Q_OBJECT

  Q_PROPERTY(QString name READ getName)
  Q_PROPERTY(QString surname READ getSurname)

  private:
    QString name;
    QString surname;

  public:
    // DataObject(QObject* parent = 0);

    // DataObject(const QString &name, const QString &surname, QObject* parent = 0);
    DataObject(const QString &name, const QString &surname);

    auto getName( ) -> QString;
    auto getSurname( ) -> QString;
};

