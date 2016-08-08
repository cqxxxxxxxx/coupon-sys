####需求列表

 需求  |  具体描述   
--------- | --------------------   
官方分享 | 官方提供url---用户扫描进入/浏览数+1---输入手机号/优惠数+1
个人分享 | 点击分享自动生成url---其他用户点击url/浏览数+1---输入手机号/优惠数+1
活动管理 | 活动的增 改 查
信息管理 | URL的点击信息和邀请接受者信息的查询

*官方url: ....?ref=xxxx*  
*个人分享url:....?ref=xxxxxx&name=任意用户名*

invite.daimaniu.cn?ref=vwZLr3&name=keepcleargas

invite.daimaniu.cn?ref=20160801&name=建军节活动




###注册

#### HTTP Request
`GET /v1/invites?phone=11位数字`

#### URL Parameters

参数 | 类型 |  描述
--------- | ----------- | -----------
phone | String | 手机号(@Size(min = 11, max = 11))

> 正确发送手机号:
>
>status ： 200

```json

{
  "ref": "1000awd",
  "phone": "13175060952",
  "type": 2
  "num": 5
  "created": 1470217456833,
}
```




#### 活动表(coupon_activity)

参数 | 类型 |  描述
--------- | ----------- | -----------   
id | int | 唯一标识 auto_incre, PK 
code | varchar | 官方邀请码，唯一对应优惠活动，八位数  
title | varchar | 优惠活动主题
des | text | 活动具体内容描述
num | int | 单人领券数
total_limit | int | 优惠券总数
sended | int | 已发数
starttime | bigint | 活动开始时间
starttime | bigint | 活动截止时间
created | bigint | 活动新建时间
updated | bigint | 活动修改时间


#### 企业组织表(organization)

参数 | 类型 |  描述
--------- | ----------- | -----------   
id | int | 唯一标识 auto_incre, PK 
code | varchar | 企业邀请码，唯一对应优惠活动，七位数  
name | varchar | 企业或者组织名字
logo | varchar | 企业或者组织的logo地址
des | text | 内容简介
num | int | 单人领券数
total_limit | int | 优惠券总数
sended | int | 已发数
starttime | bigint | 活动开始时间
starttime | bigint | 活动截止时间




#### 分享表(shared_info)

参数 | 类型 |  描述
--------- | ----------- | -----------  
id | int | 唯一标识 auto_incre, PK  
code | varchar | 邀请码
type | varchar | 0对应官方分享/1为个人分享/2为企业
phone | varchar | 获得优惠券的用户的手机号
created | bigint | 新建时间



#### 点击者信息记录表(click_info)
参数 | 类型 |  描述
--------- | ----------- | -----------   
id | int | 唯一标识 auto_incre, PK  
code | varchar | 邀请码   
type | varchar |  0对应官方/1为个人/2为企业
ip | varchar | 点击者的IP
browser | varchar | 点击者使用的浏览器
created | bigint | 新建时间




