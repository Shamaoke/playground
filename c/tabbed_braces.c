typedef union
  { int i;
    const void *v; } Arg;

typedef struct
  { unsigned int mod;
    KeySym keysym;
    void (*func)(const Arg *);
    const Arg arg; } Key;

void fullscreen (Arg *arg)
  { XEvent *e;

    e.type                 = ClientMessage;
    e.xclient.window       = win;
    e.xclient.message_type = wmatom[WMState];
    e.xclient.format       = 32;
    e.xclient.data.l[0]    = 2;
    e.xclient.data.l[1]    = wmatom[WMFullscreen];
    e.xclient.data.l[2]    = 0;

    XSendEvent(dpy, root, False, SubstructureNotifyMask, &e); }

void button_press (const XEvent *e)
  { switch (e->button)
      { case Button1: focis(i); break;
        case Button2: foics(i);
                      killclient(NULL);
                      break;
        case Button:
        case Button5 rotate(arg); } }
