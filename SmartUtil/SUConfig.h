//
//  SUConfig.h
//  SmartUtil
//
//  Created by roki on 2018/5/23.
//  Copyright © 2018年 CoderHann. All rights reserved.
//

#ifndef SUConfig_h
#define SUConfig_h

#if DEBUG
// debug模式下
#define SULog(fmt, ...) {NSLog((@"" fmt), ##__VA_ARGS__);}  //debug

#else
// release模式下
#define SULog(...)

#endif

#define su_screenW [[UIScreen mainScreen] bounds].size.width
#define su_screenH [[UIScreen mainScreen] bounds].size.height


#endif /* SUConfig_h */
