# LiaoBeiHook
某呗极速版，简易红包辅助。

## 主要代码
```
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
```

## 使用
- 直接下载工程，手机连接电脑，使用Xcode在手机运行工程即可。
- 进入群聊页面，自动秒抢当前群内红包。


## 代码仅供学习交流，感谢您 帮忙在右上角 点个“⭐️”，非常感谢。

## 关注公众号：逆向APP
<div align=center><img width="258" height="258" src="./images/qrcode_gongzhonghao.jpg"/>

## 多谢支持 ^_^
<div align=center><img width="240" height="200" src="./images/zhifubao@2x.png"/><t/><img width="240" height="200" src="./images/wechatpay@2x.png"/></div>
