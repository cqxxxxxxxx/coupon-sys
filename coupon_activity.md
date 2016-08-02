####需求列表

 需求  |  具体描述   
--------- | --------------------   
官方分享 | 官方提供url---用户扫描进入/浏览数+1---输入手机号/优惠数+1
个人分享 | 点击分享自动生成url---其他用户点击url/浏览数+1---输入手机号/优惠数+1
活动管理 | 活动的增 改 查
信息管理 | URL的点击信息和邀请接受者信息的查询

*官方url: ....?ref=xxxxxxxx*  
*个人分享url:....?ref=xxxxxx&name=任意用户名*

invite.daimaniu.cn?ref=vwZLr3&name=keepcleargas

invite.daimaniu.cn?ref=20160801&name=建军节活动

个人邀请码和个人分享URL的生成不是我做的，只需要做到把它记录进表就行，即controller中写个方法，做到把访问个人分享URL以及通过个人URL领取的人的信息记录进去。




#### 活动表(coupon_activity)

参数 | 类型 |  描述
--------- | ----------- | -----------   
id | int | 唯一标识 auto_incre, PK 
code | varchar | 官方邀请码，唯一对应优惠活动  
title | varchar | 优惠活动主题
des | text | 活动具体内容描述   
created | datetime | 新建时间
updated | datetime | 更新时间



#### 分享表(shared_info)

参数 | 类型 |  描述
--------- | ----------- | -----------  
id | int | 唯一标识 auto_incre, PK  
code | varchar | 邀请码
type | varchar | 0对应官方分享/1为个人分享
phone | varchar | 获得优惠券的用户的手机号
created | datetime | 新建时间



#### 点击者信息记录表(click_info)
参数 | 类型 |  描述
--------- | ----------- | -----------   
id | int | 唯一标识 auto_incre, PK  
code | varchar | 邀请码   
type | varchar |  0对应官方途径点击/1为个人分享途径点击
ip | varchar | 点击者的IP
browser | varchar | 点击者使用的浏览器
created | datetime | 新建时间




