#include "reimpl/native_window.h"

int32_t ANativeWindow_getHeight(ANativeWindow *window) {
    return 544;
}

int32_t ANativeWindow_getWidth(ANativeWindow *window) {
    return 960;
}

int32_t ANativeWindow_setBuffersGeometry(ANativeWindow *window, int32_t width,
                                         int32_t height, int32_t format) {
    return 0;
}
