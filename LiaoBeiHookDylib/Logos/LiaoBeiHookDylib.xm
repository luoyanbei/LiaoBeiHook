// See http://iphonedevwiki.net/index.php/Logos

#import <UIKit/UIKit.h>
#import "Header.h"
#import "_TtC3Jst29JST_RedpacketMessageViewModel.h"
#import "SLCfGiveRedPacketMessageContentImpl.h"
//#import "SLCtSocketInboundGroupChatMessagePacketProcessor.h"
//#import "SLCtServerGroupChatMessageData.h"
//#import "SLCtSocketInboundMessagePacket.h"
//#import "SLJsonObjectImpl.h"



SLCtRedPacketAgent * agent;
UIButton * grabRedpacketButton;
_TtC3Jst29JST_RedpacketMessageViewModel * redpacketMessage;

//NSDictionary * currentRedpacketInfo;
//BOOL isLoopCheckRPDetail = NO;
//
long long curGroupId;











//群聊界面
%hook _TtC3Jst27JST_GroupChatViewController

- (void)viewDidAppear:(_Bool)arg1
{
    %log;
    %orig;
    
    curGroupId = [self groupId];
    NSLog(@"groupId = (%lld)",curGroupId);
    
}


%end




//红包消息Model
%hook _TtC3Jst29JST_RedpacketMessageViewModel

- (id)initWithSLCtMessage:(id)arg1
{
    %log;
    
    redpacketMessage = %orig;
    
    long long senderId = [redpacketMessage getSenderId];
    
    SLCfGiveRedPacketMessageContentImpl * content = [redpacketMessage getContent];// <SLCfGiveRedPacketMessageContentImpl: 0x17445e240>
    
    NSLog(@"do--initWithSLCtMessage--content= (%@)",content);
    
    NSString * tradeNumber = [content getTradeNumber];
    
    long amount = (long)[content getAmount];
    
    NSString * text = [content getText];
    
    NSLog(@"do--initWithSLCtMessage--(%@, %ld, %@, %@, %@, senderId:%lld)",tradeNumber,amount,text,[content getRedPacketType],[content isCollected]?@"已抢":@"没抢",senderId);
    
    [self autoGrabRedpacket:redpacketMessage];
    
    return redpacketMessage;
}



%new
-(void)autoGrabRedpacket:(_TtC3Jst29JST_RedpacketMessageViewModel *)redpacket
{
    
    long long senderId = [redpacket getSenderId];
    
    SLCfGiveRedPacketMessageContentImpl * content = [redpacket getContent];// <SLCfGiveRedPacketMessageContentImpl: 0x17445e240>
    
    NSLog(@"do--autoGrabRedpacket--content= (%@)",content);
    
    NSString * tradeNumber = [content getTradeNumber];
    long amount = (long)[content getAmount];
    NSString * text = [content getText];
    
    NSLog(@"do--autoGrabRedpacket--(%@, %ld, %@, %@, %@, senderId:%lld)",tradeNumber,amount,text,[content getRedPacketType],[content isCollected]?@"已抢":@"没抢", senderId);
    
    SLCtRedPacketChannel * channel = [%c(SLCtRedPacketChannel) GENERAL];
    
    agent = [%c(SLCtRedPacketAgent) getInstance];
    
    // arg0
    // arg1 是 红包id
    // arg2 是 senderId
    [agent sendCollectRedPacketRequestWithSLHttpCallback:nil withNSString:tradeNumber withLong:senderId withSLCtRedPacketChannel:channel];
    NSLog(@"do--autoGrabRedpacket--finish");
}

%end


