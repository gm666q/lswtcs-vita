#include <psp2/apputil.h>

#include <string.h>

#include <falso_jni/FalsoJNI_Impl.h>

#include "utils/settings.h"
#include "utils/utils.h"

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

void OpenPrivacyPolicy(jmethodID id, va_list args) {
	static const char URL[] = "https://policies.warnerbros.com/privacy/children/";

	if (setting_openWebBrowser == false) {
		return;
	}

	SceAppUtilWebBrowserParam param = {
		.str = URL,
		.strlen = strlen(URL),
		.launchMode = 0,
		.reserved = 0
	};
	sceAppUtilLaunchWebBrowser(&param);
}

void OpenTermsOfServices(jmethodID id, va_list args) {
	static const char URL[] = "https://policies.warnerbros.com/terms/en-us/html/terms_en-us_1.2.0.html";

	if (setting_openWebBrowser == false) {
		return;
	}

	SceAppUtilWebBrowserParam param = {
		.str = URL,
		.strlen = strlen(URL),
		.launchMode = 0,
		.reserved = 0
	};
	sceAppUtilLaunchWebBrowser(&param);
}

jstring getCountryCode(jmethodID id, va_list args) {
	return country_code_str();
}

NameToMethodID nameToMethodId[] = {
		{ 100, "FlurryEvent", METHOD_TYPE_VOID },
		{ 101, "IsMusicActive", METHOD_TYPE_BOOLEAN },
		{ 102, "OpenPrivacyPolicy", METHOD_TYPE_VOID },
		{ 103, "OpenTermsOfServices", METHOD_TYPE_VOID },
		{ 104, "getCountryCode", METHOD_TYPE_OBJECT },
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
MethodsObject methodsObject[] = {
		{ 104, getCountryCode },
};
MethodsShort methodsShort[] = {};
MethodsVoid methodsVoid[] = {
		{ 100, FlurryEvent },
		{ 102, OpenPrivacyPolicy },
		{ 103, OpenTermsOfServices },
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
