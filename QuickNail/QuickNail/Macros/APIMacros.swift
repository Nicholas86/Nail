//
//  APIMacros.swift
//  SportsProduct
//
//  Created by apple on 16/10/9.
//  Copyright © 2016年 xiangguohe. All rights reserved.
//

import Foundation
/// 基础接口
let baseUrl = "http://kuaiding.sebon.com.cn/index.php?r=api/index/"
let registerUrl = baseUrl + "register"//1.注册
let loginUrl = baseUrl + "login"//2.登录
let showMemberInfoUrl = baseUrl  + "sportcmbs/member/showMemberInfo.htm" //3.显示用户资料
let updateMemberInfoUrl = baseUrl + "sportcmbs/member/updateMemberInfo.htm"//4、完善用户资料
let forgetPasswordUrl = baseUrl + "forgetpwd"//5.忘记密码
let updatePasswordUrl = baseUrl + "sportcmbs/member/updatePassword.htm"//6.修改密码
let getSubjectUrl = baseUrl + "sportcmbs/subject/getSubject.htm"//7.轮播图
let getListVenueUrl = baseUrl + "sportcmbs/childVenue/getListVenue.htm"//8.约场馆
let getListVenueSearchUrl = baseUrl + "sportcmbs/childVenue/getListVenueSearch.htm"//9.约场馆搜索
let venueDetailUrl = baseUrl + "sportcmbs/childVenue/venueDetail.htm"//10.场馆详情
let getVenueCuttingUrl = baseUrl + "sportcmbs/childVenueCutting/getVenueCutting.htm"//11.场次列表
let getVenueAmountUrl = baseUrl + "sportcmbs/childVenueCutting/getVenueAmount.htm"//12.选场次算价格
let createVenueOrderUrl = baseUrl + "sportcmbs/order/createVenueOrder.htm"//13.生成场馆订单
let getRecommendVenueUrl = baseUrl + "sportcmbs/childVenue/getRecommendVenue.htm"//14.热门场馆
let getRecommendCoachUrl = baseUrl  + "sportcmbs/coach/getRecommendCoach.htm"//15.热门教练
let getIndexSearchUrl = baseUrl + "sportcmbs/index/getIndexSearch.htm"//16.首页搜索
let getIndexKindsUrl = baseUrl + "sportcmbs/kinds/getIndexKinds.htm"//17、首页运动类型
let getIndexOtherKindsUrl = baseUrl + "sportcmbs/kinds/getIndexOtherKinds.htm"//18、首页运动类型其他
let getVenueByZoneUrl = baseUrl + "sportcmbs/childVenue/getVenueByZone.htm"//19、根据区域查场馆
let getVenueByPriceUrl = baseUrl + "sportcmbs/childVenue/getVenueByPrice.htm"//20、场馆按价格排序
let getVenueBySizeUrl = baseUrl + "sportcmbs/childVenue/getVenueBySize.htm"//21、场馆按大小排序
let getCoachByAgeUrl = baseUrl + "sportcmbs/coach/getCoachByAge.htm"//22、教练按年龄排序
let getCoachBySexUrl = baseUrl + "sportcmbs/coach/getCoachBySex.htm"//23、教练按性别查询
let getActivityByZoneIdUrl = baseUrl + "sportcmbs/activity/getActivityByZoneId.htm"//24、活动按区域查询
let getActivityByIsFreeUrl = baseUrl + "sportcmbs/activity/getActivityByIsFree.htm"//25、活动按是否收费查询
let getListAsShopUrl = baseUrl + "sportcmbs/order/getListAsShop.htm"//26、卖家版我的订单
let getListAsMemberUrl = baseUrl + "sportcmbs/order/getListAsMember.htm"//27、买家版我的订单
let getOrderDetailUrl = baseUrl + "sportcmbs/order/getOrderDetail.htm"//28、订单详情
let deleteOrderUrl = baseUrl + "sportcmbs/order/deleteOrder.htm"//29、删除订单、撤销订单
let confirmOrderUrl = baseUrl + "sportcmbs/order/confirmOrder.htm"//30、确认订单（使用完后）
let refundMoneyUrl = baseUrl + "sportcmbs/order/refundMoney.htm"//31、申请退款
let remarkUrl = baseUrl + "sportcmbs/order/remark.htm"//32、评价
let getPurseBalanceUrl = baseUrl + "sportcmbs/member/getPurseBalance.htm"//33、钱包余额
let setPayPasswordUrl = baseUrl + "sportcmbs/member/setPayPassword.htm"//34、设置提现密码
let getWithdrawalsUrl = baseUrl + "sportcmbs/withdrawals/getWithdrawals.htm"//35、申请提现
let getWithdrawalsListUrl = baseUrl + "sportcmbs/withdrawals/getWithdrawalsList.htm"//36、申请提现记录
let shortMessageUrl = baseUrl + "sportcmbs/shortMessage/shortMessage.htm"//38验证码
let addRecommendUrl = baseUrl + "sportcmbs/recommend/addRecommend.htm"//39、我有好创意,我想挑毛病,我要吐槽一下
let getRecommendListUrl = baseUrl + "sportcmbs/recommend/getRecommendList.htm"//40、我有好创意,我想挑毛病,我要吐槽一下列表展示
let getCoachDetailInfoUrl = baseUrl + "sportcmbs/coach/getCoachDetailInfo.htm"//41、教练详情
let getCourseListByMemIdUrl = baseUrl + "sportcmbs/coach/getCourseListByMemId.htm"//42、根据教练id查询课程列表
let getCoachListBySportIdUrl = baseUrl + "sportcmbs/coach/getCoachListBySportId.htm"//43.约教练、根据运动类型id分页查询教练列表
let getCoachIndexResearchUrl = baseUrl + "sportcmbs/coach/getCoachIndexResearch.htm"//44.约教练搜索
let getActivityDetailUrl = baseUrl + "sportcmbs/activity/getActivityDetail.htm"//45、查询活动详情
let getActivityBySportIdUrl = baseUrl + "sportcmbs/activity/getActivityBySportId.htm"//46、约好友 根据运动类型查询活动列表
let addActivityUrl = baseUrl + "sportcmbs/activity/addActivity.htm"//47、创建活动
let getActivityIndexResearchUrl = baseUrl + "sportcmbs/activity/getActivityIndexResearch.htm"//48、约活动 搜索
let getRecommendActivityUrl = baseUrl + "sportcmbs/activity/getRecommendActivity.htm"//49.热门活动
let addToHouseUrl = baseUrl + "sportcmbs/house/addToHouse.htm"//50、添加/取消收藏(0：场馆  1：教练  2:活动)
let cancelToHouseUrl = baseUrl + "sportcmbs/house/cancelToHouse.htm"//51、取消收藏
let getHouseListUrl = baseUrl + "sportcmbs/house/getHouseList.htm"//52、收藏列表展示
let createActiveOrderUrl = baseUrl + "sportcmbs/activity/createActiveOrder.htm"//53、活动生成订单
let createCoachOrderUrl = baseUrl + "sportcmbs/coach/createCoachOrder.htm"//54、教练生成订单
let getPublishActivityUrl = baseUrl + "sportcmbs/activity/getPublishActivity.htm"//55、会员发布的活动列表
let getActivitySignDetailUrl = baseUrl + "sportcmbs/activity/getActivitySignDetail.htm"//56、已经报名的活动列表
let cancelActivityUrl = baseUrl + "sportcmbs/activity/cancelActivity.htm"//57、用户取消已经发布的活动
let getBankNoByMemIdUrl = baseUrl + "sportcmbs/bankNo/getBankNoByMemId.htm"//60、显示会员绑定的银行卡列表
let setDefaultBankNoUrl = baseUrl + "sportcmbs/bankNo/setDefaultBankNo.htm"//61、设置默认绑定银行卡
let getHeadKindsUrl = baseUrl + "sportcmbs/kinds/getHeadKinds.htm"//63、约场馆、约教练、约活动头部类型
let alipayMoneyAppUrl = baseUrl + "sportcmbs/alipay/alipayMoneyApp.htm"//64、App支付宝支付
let isHouseUrl = baseUrl + "sportcmbs/house/isHouse.htm" //64、是否收藏
let getZoneCodeByNameUrl = baseUrl + "sportcmbs/zone/getZoneCodeByName.htm"//65、根据城市名称显示下辖各区
let preventRepetitiveUrl = baseUrl + "sportcmbs/order/preventRepetitive.htm"//66、付过款的场次不能支付


