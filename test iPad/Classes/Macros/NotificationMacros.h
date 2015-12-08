//
//  NotificationMacros.h
//  oc-weibo
//
//  Created by mac on 15/12/3.
//  Copyright © 2015年 mac. All rights reserved.
//

#ifndef NotificationMacros_h
#define NotificationMacros_h

//系统Notification定义

#define TNCancelFavoriteProductNotification @"TNCancelFavoriteProductNotification"//取消收藏时
#define TNMarkFavoriteProductNotification   @"TNMarkFavoriteProductNotification"  //标记收藏时

#define kNotficationDownloadProgressChanged @"kNotficationDownloadProgressChanged"//下载进度变化
#define kNotificationPauseDownload          @"kNotificationPauseDownload"         //暂停下载
#define kNotificationStartDownload          @"kNotificationStartDownload"         //开始下载

#define kNotificationDownloadSuccess        @"kNotificationDownloadSuccess"       //下载成功
#define kNotificationDownloadFailed         @"kNotificationDownloadFailed"        //下载失败
#define kNotificationDownloadNewMagazine    @"kNotificationDownloadNewMagazine"

#define kNotificationTransition             @"kNotificationDownloadNewMagazine"   //横竖屏转换

#endif /* NotificationMacros_h */
