# 概述

转账是异步操作，每一步均可重复调用，处理方要保证重复调用时必要操作只执行一次。

任何转账均由唯一`transferId`确定，可通过`transferId`关联查询。

`transfer-request`由wallet模块发起，核心表`transfer_requests`位于wallet库。

# Wallet -> Spots转账

1. 用户请求API：POST /v1/transfer/request/wallet/to/spots

```
{
    "currency": "BTC",
    "amount": 1.2345
}
```

1. 检查参数

2. 进入API入口`TransferApiController.transferRequestWalletToSpots()`:
  - 根据apiUniqueId防止API重放
  - 创建全局唯一transferId: `TRxxxxxx`
  - 创建TransferRequestEntity: fromUser=fromUA, toUser=toUA, transferFrom=WALLET, transferTo=SPOTS, success1=success2=false, done1=done2=false
  - done1和done2指示两步处理是否完成
  - success1和success2指示两步处理是否成功
  - 异步处理此TransferRequestEntity

异步处理入口方法`TransferRetryService.asyncCallTransferRequest(transferId)`:

  1. 根据transferId获取TransferRequestEntity；
  2. 如果done1==false，执行第一步转账:
    - 对于Wallet -> Spots，第一步从fromUserId -> transferHolder，此操作在Wallet中以事务方式完成，要求fromUserId有足够可用余额
    - 如果Wallet余额不足则直接失败(done1=done2=true,success1=success2=false)
    - 如果Wallet转账成功则继续异步执行第二步操作
  3. 如果done2==false，执行第二步转账:
    - 对于Wallet -> Spots，第二步将发送SpotsBalanceTransferEvent给定序:
      * message.transferFrom为transferHolder
      * message.transferTo为指定toUser
    - SpotsEngine执行此SpotsBalanceTransferEvent时完成内存转账:
      * 从transferHolder->toUser必定成功
      * 同步存储SpotsEngineTransferResultEntity，含发送的BalanceTransferResultMessage消息
      * 异步发送BalanceTransferResultMessage消息(若消息丢失则根据SpotsEngineTransferResultEntity表再次发送)
    - Wallet-API的TransferScheduler接收SpotsTransferResultMessage消息:
      * 设置TransferRequestEntity的done2=true, success2=true
      * 删除SpotsEngineTransferResultEntity(因为已经处理完BalanceTransferResultMessage)
      * 转账完成✅




