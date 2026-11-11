# Qt Quick и Spix: sample-0007

Учебный пример управления Qt Quick приложением из Ruby через XML-RPC.
QML встроен в `source/main.cc`. Кнопка меняет статус при клике мышью и нажатии
пробела. Клиент запускает приложение, ожидает готовности Spix, выполняет обе
операции, выводит статусы и завершает приложение.

## Окружение

- Linux, Qt 6.12 или новее с модулями Gui, Qml и Quick.
- CMake 4.4 или новее, Ninja и Clang с поддержкой C++23.
- Ruby с гемом `xmlrpc`; проверено с Ruby 4.0.7 и `xmlrpc` 0.3.4.

Пресеты приложения выбирают Clang, Ninja, C++23 и сборку Debug. Зависимости
собираются в Release и устанавливаются внутрь проекта в `vendor/install`.

```sh
gem install xmlrpc --version 0.3.4
```

Для внешнего вида исходного примера используется шрифт Iosevka Aile Semibold.
При его отсутствии Qt подбирает замену.

## Зависимости

Все команды далее выполняются из каталога `sample-0007`, если явно не указано
другое. В Git сохранены пресеты, патчи и версии зависимостей. Каталоги со
скачанными исходниками, результатами сборки и установки исключены из Git:
их можно восстановить приведёнными командами. Это позволяет сохранить
локальные исправления без включения вложенных Git-репозиториев и бинарных
файлов в основной репозиторий.

| Зависимость | Репозиторий | Коммит |
|---|---|---|
| AnyRPC | <https://github.com/sgieseking/anyrpc> | `b1949b3d40849229055ae75cf5334b9d08579502` |
| Spix | <https://github.com/faaxm/spix> | `57cf7105e1250b999104d6439df7f449ba1afe93` |

Следующие шаги предназначены для первоначальной подготовки зависимостей.
Повторно применять патчи к уже подготовленным исходникам не нужно.

### AnyRPC

Патч добавляет установку `AnyRPCConfig.cmake` с импортируемой целью
`AnyRPC::anyrpc`. Этот файл нужен для поиска установленной библиотеки при
сборке Spix. Пресет включает XML-RPC и разделяемую библиотеку; примеры,
тесты, MessagePack и log4cplus отключены.

```sh
mkdir -p vendor/source
git clone https://github.com/sgieseking/anyrpc.git vendor/source/anyrpc
git -C vendor/source/anyrpc checkout --detach b1949b3d40849229055ae75cf5334b9d08579502
git -C vendor/source/anyrpc apply ../../patches/anyrpc-local-support.patch
cp vendor/presets/anyrpc/CMakePresets.json vendor/source/anyrpc/CMakePresets.json
```

В каталоге `vendor/source/anyrpc` выполните:

```sh
cmake --preset default
cmake --build --preset default
cmake --build --preset install
```

### Spix

Патч устраняет предупреждения об устаревших конструкторах событий мыши,
событий перетаскивания и методах преобразования QVariant. Сохранена
совместимость исправленных участков с Qt 5 и Qt 6. Пресет этого примера
собирает статические библиотеки Core и QtQuick для Qt 6.

Из каталога `sample-0007` выполните:

```sh
git clone https://github.com/faaxm/spix.git vendor/source/spix
git -C vendor/source/spix checkout --detach 57cf7105e1250b999104d6439df7f449ba1afe93
git -C vendor/source/spix apply ../../patches/spix-local-support.patch
cp vendor/presets/spix/CMakePresets.json vendor/source/spix/CMakePresets.json
```

В каталоге `vendor/source/spix` выполните:

```sh
cmake --preset default
cmake --build --preset default
cmake --build --preset install
```

Копии пресетов в `vendor/presets` являются сохраняемыми в Git оригиналами.
Если изменяете пресет внутри `vendor/source`, перенесите изменения обратно
в соответствующий файл в `vendor/presets`.

## Сборка приложения

После установки обеих зависимостей в каталоге `source` выполните:

```sh
cmake --preset default
cmake --build --preset default
```

## Запуск

Из каталога `sample-0007` создайте ссылки. В новом клоне они будут относительными
и не потребуют сохранения абсолютных путей текущего рабочего окружения.

```sh
mkdir -p bin
ln -s ../source/client.rb bin/client
ln -s ../build/sample-0007 bin/server
```

Затем в каталоге `bin` выполните:

```sh
./client
```

Предварительно запускать сервер вручную не нужно. Клиент создаёт процесс
сервера, обращается к `127.0.0.1:9000` по пути `/RPC2`, активирует окно,
кликает по кнопке и отправляет пробел. Вывод дочернего процесса подавляется.
После сценария клиент отправляет `quit` и ожидает завершения процесса.
При превышении срока повторных попыток подключения клиент отправляет
процессу сигнал TERM, ожидает его завершения и сообщает об ошибке.

Ожидаемый вывод:

```text
Текущий статус: Готов!
Текущий статус: Клик мышью!
Текущий статус: Нажат пробел!
```

Сценарий пока демонстрационный: статусы выводятся без автоматического
сравнения с ожидаемыми.
