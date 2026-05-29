CC      = gcc
CFLAGS  = -O2 -fPIC -I/usr/include -I/usr/include/android \
          $(shell pkg-config --cflags glib-2.0)
LDFLAGS = -shared -Wl,-soname,libgbm-hybris.so
LIBS    = -ldl -lgralloc $(shell pkg-config --libs glib-2.0)

all: gbm_hybris.so

gbm_hybris.so: src/gbm_hybris.c
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $< $(LIBS)

install: gbm_hybris.so
	install -Dm755 gbm_hybris.so \
	    $(DESTDIR)/usr/lib/aarch64-linux-gnu/gbm/gbm_hybris.so

clean:
	rm -f gbm_hybris.so
