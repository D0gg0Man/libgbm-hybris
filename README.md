# libgbm-hybris

GBM backend using Android hybris gralloc for GNOME Shell on Mali GPU devices.

Set `GBM_BACKEND=hybris` and `GBM_BACKENDS_PATH=/usr/lib/aarch64-linux-gnu/gbm`.

GBM loads the backend file named `<GBM_BACKEND>_gbm.so`, so `GBM_BACKEND=hybris`
loads **`hybris_gbm.so`** (not `gbm_hybris.so`). The Makefile builds and installs
it under that name.

## Build
    make
    sudo make install

## Debug
    G_MESSAGES_DEBUG=all
