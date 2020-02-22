/*
 *  Copyright (c) 2015, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the BSD-style license found in the
 *  LICENSE file in the root directory of this source tree. An additional grant
 *  of patent rights can be found in the PATENTS file in the same directory.
 *
 */

#import <FBSnapshotTestCase/UIApplication+StrictKeyWindow.h>

@implementation UIApplication (StrictKeyWindow)

- (UIWindow *)fb_strictKeyWindow
{
 UIWindow        *foundWindow = nil;
  NSArray         *windows = [[UIApplication sharedApplication]windows];
  for (UIWindow   *window in windows) {
      if (window.isKeyWindow) {
          foundWindow = window;
          break;
      }
  }
  return foundWindow;
}

@end
