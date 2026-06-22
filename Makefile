CC      = gcc
CFLAGS  = -O2 -fPIC -I/usr/include -I/usr/include/android \
          $(shell pkg-config --cflags glib-2.0)
LDFLAGS = -shared -Wl,-soname,libgbm-hybris.so
LIBS    = -ldl -lgralloc $(shell pkg-config --libs glib-2.0)

# GBM loads the backend named "<GBM_BACKEND>_gbm.so". With GBM_BACKEND=hybris
# that is hybris_gbm.so -- NOT gbm_hybris.so. The output filename is therefore
# load-bearing: a file named gbm_hybris.so is never picked up by GBM.
all: hybris_gbm.so

hybris_gbm.so: src/gbm_hybris.c
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $< $(LIBS)

install: hybris_gbm.so
	install -Dm755 hybris_gbm.so \
	    $(DESTDIR)/usr/lib/aarch64-linux-gnu/gbm/hybris_gbm.so

clean:
	rm -f hybris_gbm.so
