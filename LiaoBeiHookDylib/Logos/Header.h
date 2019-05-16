//
//  Header.h
//  LiaoBeiMonkeyApp
//
//  Created by King on 2019/4/30.
//  Copyright © 2019年 King. All rights reserved.
//

#ifndef Header_h
#define Header_h

static void test()
{
//    SLCtGroupChatMessage * message = [[SLCtGroupChatMessage alloc] init];
    
    
    
}

static NSDictionary * dictionaryWithJsonString(NSString *jsonString)
{
    if (jsonString == nil)
    {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}




@interface JavaLangEnum : NSObject
{
    NSString *name_;
    int ordinal_;
}

//+ (const struct J2ObjcClassInfo *)__metadata;
+ (id)getSharedConstantsWithIOSClass:(id)arg1;
//+ (void)initialize;
+ (id)valueOfWithIOSClass:(id)arg1 withNSString:(id)arg2;
- (int)compareToWithId:(id)arg1;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (id)getDeclaringClass;
- (id)initWithNSString:(id)arg1 withInt:(int)arg2;
- (_Bool)isEqual:(id)arg1;
- (id)java_clone;
- (void)java_finalize;
- (id)name;
- (int)ordinal;
- (void)readObjectNoData;
- (void)readObjectWithJavaIoObjectInputStream:(id)arg1;


@end

@interface SLCtRedPacketChannel : JavaLangEnum
{
    int value_;
}

+ (id)CAT;
+ (id)GENERAL;
+ (const struct J2ObjcClassInfo *)__metadata;
+ (id)fromWithInt:(int)arg1;
+ (void)initialize;
+ (id)valueOfWithNSString:(id)arg1;
+ (id)values;
- (int)getValue;
- (unsigned long long)toNSEnum;

@end


@interface SLAbstractAgent : NSObject
{
}

//+ (const struct J2ObjcClassInfo *)__metadata;
- (long long)getMyUserId;
- (id)init;
- (void)sendWithSLAbstractSocketOutboundPacket:(id)arg1;

@end

@interface SLCtRedPacketAgent : SLAbstractAgent
{
}

+ (const struct J2ObjcClassInfo *)__metadata;
+ (id)getInstance;
- (id)getCatRedPacketQuota;
- (id)getGeneralRedPacketQuota;
- (id)getMaxCount;
- (id)getPredefinedTextList;
- (id)getUserRegistry;
- (id)init;
- (id)sendCatGiveGroupChatOneToOneRedPacketRequestWithSLHttpCallback:(id)arg1 withLong:(long long)arg2 withLong:(long long)arg3 withDouble:(double)arg4 withNSString:(id)arg5 withNSString:(id)arg6 withNSString:(id)arg7 withNSString:(id)arg8;
- (id)sendCatGiveOneToManyFixAmountRedPacketRequestWithSLHttpCallback:(id)arg1 withLong:(long long)arg2 withDouble:(double)arg3 withInt:(int)arg4 withNSString:(id)arg5 withNSString:(id)arg6 withNSString:(id)arg7 withNSString:(id)arg8;
- (id)sendCatGiveOneToManyRandomAmountRedPacketRequestWithSLHttpCallback:(id)arg1 withLong:(long long)arg2 withDouble:(double)arg3 withInt:(int)arg4 withNSString:(id)arg5 withNSString:(id)arg6 withNSString:(id)arg7 withNSString:(id)arg8;
- (id)sendCatGivePrivateChatOneToOneRedPacketRequestWithSLHttpCallback:(id)arg1 withLong:(long long)arg2 withDouble:(double)arg3 withNSString:(id)arg4 withNSString:(id)arg5 withNSString:(id)arg6 withNSString:(id)arg7;
- (id)sendCollectRedPacketRequestWithSLHttpCallback:(id)arg1 withNSString:(id)arg2 withLong:(long long)arg3 withSLCtRedPacketChannel:(id)arg4;
- (id)sendGetMyCollectedRedPacketListRequestWithSLHttpCallback:(id)arg1 withJavaLangLong:(id)arg2 withSLCtRedPacketChannel:(id)arg3;
- (id)sendGetMyGivenRedPacketRequestWithSLHttpCallback:(id)arg1 withJavaLangLong:(id)arg2 withSLCtRedPacketChannel:(id)arg3;
- (id)sendGetMyLongTimeNoCollectionRedPacketListRequestWithSLHttpCallback:(id)arg1 withLong:(long long)arg2 withLong:(long long)arg3 withNSString:(id)arg4;
- (id)sendGetRedPacketDetailsRequestWithSLHttpCallback:(id)arg1 withJavaLangLong:(id)arg2 withNSString:(id)arg3 withLong:(long long)arg4 withSLCtRedPacketChannel:(id)arg5;
- (id)sendGetRedPacketStatusRequestWithSLHttpCallback:(id)arg1 withNSString:(id)arg2 withLong:(long long)arg3 withSLCtRedPacketChannel:(id)arg4;
- (void)sendGetSettingsRequestWithSLHttpCallback:(id)arg1;
- (id)sendGiveCatRedPacketBeforeCheckRequestWithSLHttpCallback:(id)arg1 withJavaLangLong:(id)arg2 withJavaLangLong:(id)arg3 withDouble:(double)arg4 withNSString:(id)arg5 withInt:(int)arg6;
- (id)sendGiveGroupChatOneToOneRedPacketRequestWithSLHttpCallback:(id)arg1 withLong:(long long)arg2 withLong:(long long)arg3 withDouble:(double)arg4 withNSString:(id)arg5 withNSString:(id)arg6;
- (id)sendGiveOneToManyFixAmountRedPacketRequestWithSLHttpCallback:(id)arg1 withLong:(long long)arg2 withDouble:(double)arg3 withInt:(int)arg4 withNSString:(id)arg5 withNSString:(id)arg6;
- (id)sendGiveOneToManyRandomAmountRedPacketRequestWithSLHttpCallback:(id)arg1 withLong:(long long)arg2 withDouble:(double)arg3 withInt:(int)arg4 withNSString:(id)arg5 withNSString:(id)arg6;
- (id)sendGivePrivateChatOneToOneRedPacketRequestWithSLHttpCallback:(id)arg1 withLong:(long long)arg2 withDouble:(double)arg3 withNSString:(id)arg4 withNSString:(id)arg5;

@end


@interface _TtC3Jst27JST_GroupChatViewController : UIViewController
@property(nonatomic, readonly) long long groupId; // @synthesize groupId;

@end

@interface _TtC3Jst25JST_MessageViewController : UIViewController

@end


@interface SLCtMessage : NSObject
{
}

+ (const struct J2ObjcClassInfo *)__metadata;

@end




#endif /* Header_h */
