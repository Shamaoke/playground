
#pragma once

#include <QString>

class Status {

  private:
    QString readyStatus { QStringLiteral("Готов!") };

  public:
    auto ready( ) const -> QString {
      return readyStatus;
    }
};

