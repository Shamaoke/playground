**pdfmrg**

````
pdfmrg -p:t PAGE_TITLE -p:n PAGE_NUMBER -p:w PAGE_WIDTH -p:h PAGE_HEIGHT -t:w TEXT_WIDTH -t:h TEXT_HEIGHT
````

Calculate margins for pages of PDF documents.

# Options #

**-p:t**

  Specify a page heading.

**-p:n**

  Specify a page number.

**-p:w**

  Specify page width.

**-p:h**

  Specify page height.

**-t:w**

  Specify text block width.

**-t:h**

  Specify text block height.

**-m:h:t**

  Specify headear top margin.

**-m:h:b**

  Specify header bottom margin.

**-m:f:t**

  Specify footer top margin.

**-m:f:b**

  Specify footer bottom margin.

**-c:s**

  Specify page cutting size.

# Examples #

````
Основное содержание, cс. 9..309
  ----
  Страница
  ----
  Ширина: 182.00 мм
  Высота: 257.00 мм
  ----
  Текст
  ----
  Ширина: 142.80 мм
  Высота: 194.60 мм
  ----
  Границы текст
  ----
  Верхняя:  31.20 мм
  Правая:  162.40 мм
  Нижняя:  225.80 мм
  Левая:    19.60 мм
  ----
  Размер обрезки: 3.00 мм
  ----
  Границы обрезка текст
  ----
  Верхняя:  28.20 мм
  Правая:  165.40 мм ( 16.60 мм)
  Нижняя:  228.80 мм ( 28.20 мм)
  Левая:    16.60 мм
  ----
  Границы верхний колонтитул
  ----
  Верхняя:  19.78 мм
  Нижняя:   22.78 мм
  ----
  Границы нижний колонтитул
  ----
  Верхняя: 231.96 мм
  Нижняя:  234.52 мм
  ----
  Границы обрезка верхний колонтитул
  ----
  Верхняя:  16.78 мм
  ----
  Границы обрезка нижний колонтитул
  ---
  Нижняя: 237.52 мм ( 19.48 мм)
````

