# 签名

1. 构造签名字符串: `GET|POST ISO-DateTime`，其中ISO-DateTime是过期时间

以GET开头的过期时间允许最长24小时，以POST开头的过期时间允许最长1分钟

2. 签名获得`0x1234abcd..`字符串，均为小写

3. 构造`Authorization: Signature GET 2021-10-27T02:43:54.331Z 0x1234abcd`，注意大小写敏感

4. 发送此Header

# 验证

服务器验证签名后，获得地址`0x1A2b...8E9f`，根据地址查找`UserEntity`，计算`uniqueId = sha1(AuthorizationHeader)`，构造`Auth`：

```
Auth auth = new Auth(address, user, uniqueId)
```

注意：

- 如果address==null，则user为null；
- 如果address!=null，user也可能为null，因为系统不会为新地址立刻创建User，直到检测到第一次deposit后，才会创建User；
