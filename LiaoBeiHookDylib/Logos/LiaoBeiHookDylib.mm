#line 1 "/Users/king/Desktop/2019Work/Pan/聊呗/LiaoBeiHook/LiaoBeiHookDylib/Logos/LiaoBeiHookDylib.xm"


#import <UIKit/UIKit.h>
#import "Header.h"
#import "_TtC3Jst29JST_RedpacketMessageViewModel.h"
#import "SLCfGiveRedPacketMessageContentImpl.h"







SLCtRedPacketAgent * agent;
UIButton * grabRedpacketButton;
_TtC3Jst29JST_RedpacketMessageViewModel * redpacketMessage;




long long curGroupId;













#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class _TtC3Jst29JST_RedpacketMessageViewModel; @class SLCtRedPacketAgent; @class _TtC3Jst27JST_GroupChatViewController; @class SLCtRedPacketChannel; 
static void (*_logos_orig$_ungrouped$_TtC3Jst27JST_GroupChatViewController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL _TtC3Jst27JST_GroupChatViewController* _LOGOS_SELF_CONST, SEL, _Bool); static void _logos_method$_ungrouped$_TtC3Jst27JST_GroupChatViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL _TtC3Jst27JST_GroupChatViewController* _LOGOS_SELF_CONST, SEL, _Bool); static _TtC3Jst29JST_RedpacketMessageViewModel* (*_logos_orig$_ungrouped$_TtC3Jst29JST_RedpacketMessageViewModel$initWithSLCtMessage$)(_LOGOS_SELF_TYPE_INIT _TtC3Jst29JST_RedpacketMessageViewModel*, SEL, id) _LOGOS_RETURN_RETAINED; static _TtC3Jst29JST_RedpacketMessageViewModel* _logos_method$_ungrouped$_TtC3Jst29JST_RedpacketMessageViewModel$initWithSLCtMessage$(_LOGOS_SELF_TYPE_INIT _TtC3Jst29JST_RedpacketMessageViewModel*, SEL, id) _LOGOS_RETURN_RETAINED; static void _logos_method$_ungrouped$_TtC3Jst29JST_RedpacketMessageViewModel$autoGrabRedpacket$(_LOGOS_SELF_TYPE_NORMAL _TtC3Jst29JST_RedpacketMessageViewModel* _LOGOS_SELF_CONST, SEL, _TtC3Jst29JST_RedpacketMessageViewModel *); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SLCtRedPacketChannel(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SLCtRedPacketChannel"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SLCtRedPacketAgent(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SLCtRedPacketAgent"); } return _klass; }
#line 34 "/Users/king/Desktop/2019Work/Pan/聊呗/LiaoBeiHook/LiaoBeiHookDylib/Logos/LiaoBeiHookDylib.xm"



static void _logos_method$_ungrouped$_TtC3Jst27JST_GroupChatViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL _TtC3Jst27JST_GroupChatViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _Bool arg1) {
    HBLogDebug(@"-[<_TtC3Jst27JST_GroupChatViewController: %p> viewDidAppear:%d]", self, arg1);
    _logos_orig$_ungrouped$_TtC3Jst27JST_GroupChatViewController$viewDidAppear$(self, _cmd, arg1);
    
    curGroupId = [self groupId];
    NSLog(@"groupId = (%lld)",curGroupId);
    
}











static _TtC3Jst29JST_RedpacketMessageViewModel* _logos_method$_ungrouped$_TtC3Jst29JST_RedpacketMessageViewModel$initWithSLCtMessage$(_LOGOS_SELF_TYPE_INIT _TtC3Jst29JST_RedpacketMessageViewModel* __unused self, SEL __unused _cmd, id arg1) _LOGOS_RETURN_RETAINED {
    HBLogDebug(@"-[<_TtC3Jst29JST_RedpacketMessageViewModel: %p> initWithSLCtMessage:%@]", self, arg1);
    
    redpacketMessage = _logos_orig$_ungrouped$_TtC3Jst29JST_RedpacketMessageViewModel$initWithSLCtMessage$(self, _cmd, arg1);
    
    long long senderId = [redpacketMessage getSenderId];
    
    SLCfGiveRedPacketMessageContentImpl * content = [redpacketMessage getContent];
    
    NSLog(@"do--initWithSLCtMessage--content= (%@)",content);
    
    NSString * tradeNumber = [content getTradeNumber];
    
    long amount = (long)[content getAmount];
    
    NSString * text = [content getText];
    
    NSLog(@"do--initWithSLCtMessage--(%@, %ld, %@, %@, %@, senderId:%lld)",tradeNumber,amount,text,[content getRedPacketType],[content isCollected]?@"已抢":@"没抢",senderId);
    
    [self autoGrabRedpacket:redpacketMessage];
    
    return redpacketMessage;
}





static void _logos_method$_ungrouped$_TtC3Jst29JST_RedpacketMessageViewModel$autoGrabRedpacket$(_LOGOS_SELF_TYPE_NORMAL _TtC3Jst29JST_RedpacketMessageViewModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, _TtC3Jst29JST_RedpacketMessageViewModel * redpacket) {
    
    long long senderId = [redpacket getSenderId];
    
    SLCfGiveRedPacketMessageContentImpl * content = [redpacket getContent];
    
    NSLog(@"do--autoGrabRedpacket--content= (%@)",content);
    
    NSString * tradeNumber = [content getTradeNumber];
    long amount = (long)[content getAmount];
    NSString * text = [content getText];
    
    NSLog(@"do--autoGrabRedpacket--(%@, %ld, %@, %@, %@, senderId:%lld)",tradeNumber,amount,text,[content getRedPacketType],[content isCollected]?@"已抢":@"没抢", senderId);
    
    SLCtRedPacketChannel * channel = [_logos_static_class_lookup$SLCtRedPacketChannel() GENERAL];
    
    agent = [_logos_static_class_lookup$SLCtRedPacketAgent() getInstance];
    
    
    
    
    [agent sendCollectRedPacketRequestWithSLHttpCallback:nil withNSString:tradeNumber withLong:senderId withSLCtRedPacketChannel:channel];
    NSLog(@"do--autoGrabRedpacket--finish");
}




static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$_TtC3Jst27JST_GroupChatViewController = objc_getClass("_TtC3Jst27JST_GroupChatViewController"); MSHookMessageEx(_logos_class$_ungrouped$_TtC3Jst27JST_GroupChatViewController, @selector(viewDidAppear:), (IMP)&_logos_method$_ungrouped$_TtC3Jst27JST_GroupChatViewController$viewDidAppear$, (IMP*)&_logos_orig$_ungrouped$_TtC3Jst27JST_GroupChatViewController$viewDidAppear$);Class _logos_class$_ungrouped$_TtC3Jst29JST_RedpacketMessageViewModel = objc_getClass("_TtC3Jst29JST_RedpacketMessageViewModel"); MSHookMessageEx(_logos_class$_ungrouped$_TtC3Jst29JST_RedpacketMessageViewModel, @selector(initWithSLCtMessage:), (IMP)&_logos_method$_ungrouped$_TtC3Jst29JST_RedpacketMessageViewModel$initWithSLCtMessage$, (IMP*)&_logos_orig$_ungrouped$_TtC3Jst29JST_RedpacketMessageViewModel$initWithSLCtMessage$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(_TtC3Jst29JST_RedpacketMessageViewModel *), strlen(@encode(_TtC3Jst29JST_RedpacketMessageViewModel *))); i += strlen(@encode(_TtC3Jst29JST_RedpacketMessageViewModel *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$_TtC3Jst29JST_RedpacketMessageViewModel, @selector(autoGrabRedpacket:), (IMP)&_logos_method$_ungrouped$_TtC3Jst29JST_RedpacketMessageViewModel$autoGrabRedpacket$, _typeEncoding); }} }
#line 112 "/Users/king/Desktop/2019Work/Pan/聊呗/LiaoBeiHook/LiaoBeiHookDylib/Logos/LiaoBeiHookDylib.xm"
