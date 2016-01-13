//
//  Constants.h
//  Freeearth
//
//  Created by 冯春 on 16/1/2.
//  Copyright © 2016年 One. All rights reserved.
//

#define leftGap   10
#define popH   64
#define mainW     [UIScreen mainScreen].bounds.size.width
#define mainH     [UIScreen mainScreen].bounds.size.height

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height


#define colorWithRGB(rgbValue,alphaValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:alphaValue]