
#pragma once

#include <QObject>
#include <QString>

class StatusProvider : public QObject {

  Q_OBJECT

  private:
    QString readyStatus { QStringLiteral("Готов!") };
    QString mousePressedStatus { QStringLiteral("Клик мышью!") };
    QString spacePressedStatus { QStringLiteral("Нажат пробел!") };

  public:
    Q_INVOKABLE auto ready( ) const -> QString;

    Q_INVOKABLE auto mousePressed( ) const -> QString;

    Q_INVOKABLE auto spacePressed( ) const -> QString;
};

