# API

API响应格式：200=正常，429=超出频率限制，400=请求错误，5xx=服务器错误

## 成功响应

code=200，格式：

```
{
    success: true,
    data: <响应数据>
}
```

## 错误响应

code=200，格式：

```
{
    success: false,
    error: "PARAMETER_INVALID", // 错误代码
    errorField: "symbol", // 错误字段，可能为null
    errorMessage: "Symbol not found" // 错误详细信息
}
```
