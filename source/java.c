#include <falso_jni/FalsoJNI_Impl.h>

#include "reimpl/log.h"

/*
 * JNI Methods
*/

void FlurryEvent(jmethodID id, va_list args) {
	jstring p0 = va_arg(args, jstring);

	__android_log_print(ANDROID_LOG_DEBUG, "TT", "[FLURRY] Event: %s", (char *) p0);
}

jboolean IsMusicActive(jmethodID id, va_list args) {
	return 0;
}

NameToMethodID nameToMethodId[] = {
		{ 100, "FlurryEvent", METHOD_TYPE_VOID },
		{ 101, "IsMusicActive", METHOD_TYPE_BOOLEAN },
};

MethodsBoolean methodsBoolean[] = {
		{ 101, IsMusicActive },
};
MethodsByte methodsByte[] = {};
MethodsChar methodsChar[] = {};
MethodsDouble methodsDouble[] = {};
MethodsFloat methodsFloat[] = {};
MethodsInt methodsInt[] = {};
MethodsLong methodsLong[] = {};
MethodsObject methodsObject[] = {};
MethodsShort methodsShort[] = {};
MethodsVoid methodsVoid[] = {
		{ 100, FlurryEvent },
};

/*
 * JNI Fields
*/

// System-wide constant that applications sometimes request
// https://developer.android.com/reference/android/content/Context.html#WINDOW_SERVICE
char WINDOW_SERVICE[] = "window";

// System-wide constant that's often used to determine Android version
// https://developer.android.com/reference/android/os/Build.VERSION.html#SDK_INT
// Possible values: https://developer.android.com/reference/android/os/Build.VERSION_CODES
const int SDK_INT = 21; // Android 5.0.2 / Lollipop

NameToFieldID nameToFieldId[] = {
		{ 0, "WINDOW_SERVICE", FIELD_TYPE_OBJECT },
		{ 1, "SDK_INT", FIELD_TYPE_INT },
};

FieldsBoolean fieldsBoolean[] = {};
FieldsByte fieldsByte[] = {};
FieldsChar fieldsChar[] = {};
FieldsDouble fieldsDouble[] = {};
FieldsFloat fieldsFloat[] = {};
FieldsInt fieldsInt[] = {
		{ 1, SDK_INT },
};
FieldsObject fieldsObject[] = {
		{ 0, WINDOW_SERVICE },
};
FieldsLong fieldsLong[] = {};
FieldsShort fieldsShort[] = {};

__FALSOJNI_IMPL_CONTAINER_SIZES
