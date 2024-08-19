static const char num_before[ ]    = "[";
static const char num_separator[ ] = " ";
static const char num_after[ ]     = "]";

void drawtitle (char title[256])
  { int   size           = sizeof(title);
    char  format[ ]      = "%s%d%s%s%s";      // `[1] vim'
    char  prefix[ ]      = num_before;        // `['
    int  *number         = inc(c);            // `1'
    char  postfix[ ]     = num_after;         // `]
    char  separator[ ]   = num_separator;     // ` '
    char *client_name[ ] = &clients[c]->name; // `vim'

    prefix  = "<<<"; // num_before := prefix, i. e. "<<<"
    postfix = ">>>"; // num_after  := postfix, i. e. ">>>"

    sprintf(
      title,
      size,
      format,
      prefix,
      number,
      postfix,
      separator,
      client_name );

    drawtext(title, col); }
