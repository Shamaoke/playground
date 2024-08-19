// 1. ddjvu -format=tiff -eachpage book.djvu page_%03d.tiff
// 1. ddjvu -format=tiff book.djvu book.tiff
// 2a. convert -crop 50%x100% page_*.tiff p_%03d.tiff
// 2b. mogrify -crop 50%x100% +repage -path ../result *.tiff
// 2c. mogrify -crop 2x1@ +repage -path ../result *.tiff

let render = (l, r = '', i = length(l), [h, ...t] = l) =>
  is_empty(l) ? r
              : render(t, `${r}${h}${dec(i)}`)
