// Generated by Apple Swift version 5.0 (swiftlang-1001.0.69.5 clang-1001.0.46.3)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <Foundation/Foundation.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if __has_feature(modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import Foundation;
@import ObjectiveC;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="SoundCastIosSdk",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif


SWIFT_CLASS("_TtC15SoundCastIosSdk11CompanionAd")
@interface CompanionAd : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC15SoundCastIosSdk9Constants")
@interface Constants : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, copy) NSString * _Nullable token;)
+ (NSString * _Nullable)token SWIFT_WARN_UNUSED_RESULT;
+ (void)setToken:(NSString * _Nullable)value;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, copy) NSString * _Nonnull VAST;)
+ (NSString * _Nonnull)VAST SWIFT_WARN_UNUSED_RESULT;
+ (void)setVAST:(NSString * _Nonnull)value;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, copy) NSString * _Nonnull DAAST;)
+ (NSString * _Nonnull)DAAST SWIFT_WARN_UNUSED_RESULT;
+ (void)setDAAST:(NSString * _Nonnull)value;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull pre_roll;)
+ (NSString * _Nonnull)pre_roll SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull mid_roll;)
+ (NSString * _Nonnull)mid_roll SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull mainMedia;)
+ (NSString * _Nonnull)mainMedia SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull adMedia;)
+ (NSString * _Nonnull)adMedia SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull normal;)
+ (NSString * _Nonnull)normal SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull test;)
+ (NSString * _Nonnull)test SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull creativeTypeUrl;)
+ (NSString * _Nonnull)creativeTypeUrl SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull creativeTypeCode;)
+ (NSString * _Nonnull)creativeTypeCode SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC15SoundCastIosSdk8Creative")
@interface Creative : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
- (NSString * _Nullable)getURLCreative SWIFT_WARN_UNUSED_RESULT;
- (NSArray<NSDictionary<NSString *, id> *> * _Nullable)getCreativeCategories SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_CLASS("_TtC15SoundCastIosSdk14ErrorSoundCast")
@interface ErrorSoundCast : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull TimeOut;)
+ (NSString * _Nonnull)TimeOut SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull Connect;)
+ (NSString * _Nonnull)Connect SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull PlayMedia;)
+ (NSString * _Nonnull)PlayMedia SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull Convert;)
+ (NSString * _Nonnull)Convert SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull Token;)
+ (NSString * _Nonnull)Token SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull EventName;)
+ (NSString * _Nonnull)EventName SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull ParsingXML;)
+ (NSString * _Nonnull)ParsingXML SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull IncompatibleCreative;)
+ (NSString * _Nonnull)IncompatibleCreative SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC15SoundCastIosSdk9EventName")
@interface EventName : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull EventSkip;)
+ (NSString * _Nonnull)EventSkip SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull EventStart;)
+ (NSString * _Nonnull)EventStart SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull EventPause;)
+ (NSString * _Nonnull)EventPause SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull EventResume;)
+ (NSString * _Nonnull)EventResume SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull EventRewind;)
+ (NSString * _Nonnull)EventRewind SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull EventFirstQuartile;)
+ (NSString * _Nonnull)EventFirstQuartile SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull EventMidpoint;)
+ (NSString * _Nonnull)EventMidpoint SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull EventThirdQuartile;)
+ (NSString * _Nonnull)EventThirdQuartile SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull EventComplete;)
+ (NSString * _Nonnull)EventComplete SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull CreativeView;)
+ (NSString * _Nonnull)CreativeView SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull Error;)
+ (NSString * _Nonnull)Error SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull Impression;)
+ (NSString * _Nonnull)Impression SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull Duration;)
+ (NSString * _Nonnull)Duration SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull ClickThrough;)
+ (NSString * _Nonnull)ClickThrough SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull ClickTracking;)
+ (NSString * _Nonnull)ClickTracking SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull CompanionCreativeView;)
+ (NSString * _Nonnull)CompanionCreativeView SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull CompanionClickTracking;)
+ (NSString * _Nonnull)CompanionClickTracking SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull CompanionClickThrough;)
+ (NSString * _Nonnull)CompanionClickThrough SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC15SoundCastIosSdk9ObjectAds")
@interface ObjectAds : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end

@class NSXMLParser;

SWIFT_CLASS("_TtC15SoundCastIosSdk17ParsingXMLManager")
@interface ParsingXMLManager : NSObject <NSXMLParserDelegate>
- (void)parserDidStartDocument:(NSXMLParser * _Nonnull)parser;
- (void)parser:(NSXMLParser * _Nonnull)parser didStartElement:(NSString * _Nonnull)elementName namespaceURI:(NSString * _Nullable)namespaceURI qualifiedName:(NSString * _Nullable)qName attributes:(NSDictionary<NSString *, NSString *> * _Nonnull)attributeDict;
- (void)parser:(NSXMLParser * _Nonnull)parser foundCDATA:(NSData * _Nonnull)CDATABlock;
- (void)parser:(NSXMLParser * _Nonnull)parser foundCharacters:(NSString * _Nonnull)string;
- (void)parser:(NSXMLParser * _Nonnull)parser didEndElement:(NSString * _Nonnull)elementName namespaceURI:(NSString * _Nullable)namespaceURI qualifiedName:(NSString * _Nullable)qName;
- (void)parserDidEndDocument:(NSXMLParser * _Nonnull)parser;
- (void)parser:(NSXMLParser * _Nonnull)parser parseErrorOccurred:(NSError * _Nonnull)parseError;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC15SoundCastIosSdk13ResponseModel")
@interface ResponseModel : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
- (NSString * _Nonnull)getMode SWIFT_WARN_UNUSED_RESULT;
- (Creative * _Nullable)getCreative SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nonnull)getToken SWIFT_WARN_UNUSED_RESULT;
@end

@protocol SoundCastDelegate;
@protocol SoundCastDataSource;

SWIFT_PROTOCOL("_TtP15SoundCastIosSdk17SoundCastProtocol_")
@protocol SoundCastProtocol
@property (nonatomic, strong) id <SoundCastDelegate> _Nullable delegate;
@property (nonatomic, strong) id <SoundCastDataSource> _Nullable dataSource;
- (void)loadAd:(NSString * _Nonnull)soundcastID :(NSString * _Nullable)pageTitle :(NSString * _Nullable)pageDescription :(NSString * _Nullable)keywords :(NSString * _Nullable)pageUrl :(NSString * _Nullable)tags;
@end


SWIFT_CLASS("_TtC15SoundCastIosSdk19SoundCastController")
@interface SoundCastController : NSObject <SoundCastProtocol>
@property (nonatomic, strong) id <SoundCastDelegate> _Nullable delegate;
@property (nonatomic, strong) id <SoundCastDataSource> _Nullable dataSource;
- (void)setAdsZone:(NSString * _Nonnull)zone :(int32_t)timeStart;
- (NSString * _Nonnull)getAdsZone SWIFT_WARN_UNUSED_RESULT;
- (void)enableTestMode:(BOOL)status;
- (void)onErrorWithErr:(NSString * _Nonnull)err;
- (void)setTimeOut:(NSInteger)timeOut;
- (NSInteger)getTimeOut SWIFT_WARN_UNUSED_RESULT;
- (void)setTimeSkip:(int32_t)timeSkip;
- (int32_t)getTimeSkip SWIFT_WARN_UNUSED_RESULT;
- (int32_t)getTimeStart SWIFT_WARN_UNUSED_RESULT;
- (float)getTimeCurrent SWIFT_WARN_UNUSED_RESULT;
- (float)getTimeTotal SWIFT_WARN_UNUSED_RESULT;
- (ObjectAds * _Nullable)getObjectAds SWIFT_WARN_UNUSED_RESULT;
- (ResponseModel * _Nullable)getResponseModel SWIFT_WARN_UNUSED_RESULT;
- (NSXMLParser * _Nullable)getParser SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nonnull)firstCharacterLowcaseWithStr:(NSString * _Nonnull)str SWIFT_WARN_UNUSED_RESULT;
- (void)loadAd:(NSString * _Nonnull)soundcastID :(NSString * _Nullable)pageTitle :(NSString * _Nullable)pageDescription :(NSString * _Nullable)keywords :(NSString * _Nullable)pageUrl :(NSString * _Nullable)tags;
- (void)loadParserWithUrl:(NSString * _Nonnull)url;
- (void)didFinishWithParserWithResponse:(NSXMLParser * _Nonnull)response;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (BOOL)isPlayAd SWIFT_WARN_UNUSED_RESULT;
- (void)play;
- (void)pause;
- (void)playAd;
- (void)skipAd;
- (void)playerDidFinishPlaying;
- (void)stopMedia;
@end


SWIFT_PROTOCOL("_TtP15SoundCastIosSdk19SoundCastDataSource_")
@protocol SoundCastDataSource
- (void)didFinishWithAd;
- (void)didFinishNotAd;
- (void)didFinishTrackEventWithResponse:(NSDictionary<NSString *, id> * _Nonnull)response;
@end


SWIFT_PROTOCOL("_TtP15SoundCastIosSdk17SoundCastDelegate_")
@protocol SoundCastDelegate
- (void)onErrorWithError:(NSString * _Nonnull)error;
- (void)onErrorTrackingWithError:(NSString * _Nonnull)error;
- (void)onErrorLoadMediaWithError:(NSString * _Nonnull)error;
- (void)showButtonSkip;
- (void)didImpression;
- (void)didError;
- (void)didClickTracking;
- (void)didClickThrough;
- (void)didCreativeView;
- (void)didStart;
- (void)didSkip;
- (void)didPause;
- (void)didResume;
- (void)didRewind;
- (void)didFirstQuartile;
- (void)didMidPoint;
- (void)didThirdQuartile;
- (void)playing;
- (void)didPlayToEndAd;
- (void)didCompanionCreativeView;
- (void)didCompanionClickTracking;
- (void)didCompanionClickThrough;
@end


#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
