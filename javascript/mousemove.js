let mousemove = *(e = yield) => {
    e.type == 'mousemove' ? move(e)
  : e.type == 'mouseup'   ? 
}

let move = *(e = yield) =>
  if (e.type == 'mousemove') move(e)
