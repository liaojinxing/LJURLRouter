#LJURLRouter#

URL Router for any object in iOS.

##Why another router##

There are many open source routers, why make this wheel again?

Almost other routers are limited to controller or block, while LJURLRouter can route any object.

##Use cases##

- In some cases, use an url to represent an object when communicating with server, will reduce network traffic.

- Just openURL to navigate a controller, but not import the controller header file and call pushViewController...

- Other than navigation inside app, you can handle navigation easily for url schema, deep link, 3D Touch, spotlight search.


##How to Use##

####Register url mapping####

Register url formats and the matching class.

```objective-c
[[LJURLRouter sharedRouter] registerURL:YOUR_URL_FORMAT forClass:[YOUR_CLASS_NAME class]];
```

for example:

```objective-c
[[LJURLRouter sharedRouter] registerURL:@"/profile/:profile_id" forClass:[ProfileViewController class]];
```

####Get matching instance####

Get matching object instance from URL. Params will be parsed automatically

```objective-c
id instance = [[LJURLRouter sharedRouter] instanceWithRouteURL:YOUR_URL_HERE];
```

for example:

```objective-c
id instance = [[LJURLRouter sharedRouter] instanceWithRouteURL:@"/profile/123?param1=hello&param2=world"];
```

####UIViewController Category####

LJURLRouter also provides a category of UIViewController for convienient use.

```objective-c
[controller openURL:@"/profile/123?param1=hello&param2=world"]
```

####More features...####

- Default schema is also supported.

- UIViewController category supports multi route types, including push in navigation controller and present.

- For more details, please check the demo project and unit tests.

##Installation##

Grab the source file into your project.

Or use cocoapods. Here is an example of your podfile:

```objective-c
pod 'LJURLRouter'
```

##License##

LJURLRouter is available under the MIT license. See the LICENSE file for more info.

#中文介绍#

##为什么要造轮子##

开源社区已经有很多不错的router，但并不满足需求。

很多实现都是局限于controller和block，LJURLRouter主要是用于对象的映射，支持任意class.

##使用场景##

- 与server通信时，很多情况下无法直接传递对象，或者为了节省流量，可以通过定义一套url routing协议来进行通信。例如使用/user/123 代表123这个user，而无需返回一个user对象。

- 处理端内页面的跳转时，可以直接openURL，而无需import controller，再pushViewController

- 可以轻松地处理推送通知, url schema, deep link, 3D Touch, spotlight search 等跳转

##使用方法##

####注册URL和class的映射关系####

```objective-c
[[LJURLRouter sharedRouter] registerURL:YOUR_URL_FORMAT forClass:[YOUR_CLASS_NAME class]];
```

例子:

```objective-c
[[LJURLRouter sharedRouter] registerURL:@"/profile/:profile_id" forClass:[ProfileViewController class]];
```
####根据URL获得相应的对象实例####

```objective-c
id instance = [[LJURLRouter sharedRouter] instanceWithRouteURL:YOUR_URL_HERE];
```

例子:

```objective-c
id instance = [[LJURLRouter sharedRouter] instanceWithRouteURL:@"/profile/123?param1=hello&param2=world"];
```

####UIViewController Category####

提供了一个UIViewController的category，可以方便地进行controller之间的跳转

```objective-c
[controller openURL:@"/profile/123?param1=hello&param2=world"]
```

####其他特性####

- LJURLRouter支持默认schema

- 更详细的使用方法，可以看demo和单元测试

##安装##

可以直接把源码放到你的工程里，或者使用CocoaPods:

```objective-c
pod 'LJURLRouter'
```

##许可证##
MIT

订阅文章
-------
欢迎关注[简书]，关注微信公众号(iOSers)，订阅高质量原创技术文章：

<img src="http://upload-images.jianshu.io/upload_images/1859836-2f44998e2341e34d.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240" alt="公众号" width="300px" hspace="10"/>

[简书]:http://www.jianshu.com/users/25481f0294aa/latest_articles
