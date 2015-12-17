#LJURLRouter#

URL Router for any object in iOS.

##Why another router##

There are many open source routers, why make this wheel again?

Almost other routers are limited to controller or block, while LJURLRouter can route any object.

##How to Use##

####Register url mapping####

Register url formats and the matching class.

```
[[LJURLRouter sharedRouter] registerURL:YOUR_URL_FORMAT forClass:[YOUR_CLASS_NAME class]];
```

for example:

```
[[LJURLRouter sharedRouter] registerURL:@"/profile/:profile_id" forClass:[ProfileViewController class]];
```

####Get matching instance####

Get matching object instance from URL. Params will be parsed automatically

```
id instance = [[LJURLRouter sharedRouter] instanceWithRouteURL:YOUR_URL_HERE];
```

for example:

```
id instance = [[LJURLRouter sharedRouter] instanceWithRouteURL:@"/profile/123?param1=hello&param2=world"];
```

####UIViewController Category####

LJURLRouter also provides a category of UIViewController for convienient use.

```
[controller openURL:@"/profile/123?param1=hello&param2=world"]
```

####More features...####

- Default schema is also supported.

- UIViewController category supports multi route types, including push in navigation controller and present.

- For more details, please check the demo project and unit tests.

##Installation##

Grab the source file into your project.

Or use cocoapods. Here is an example of your podfile:

```
pod 'LJURLRouter'
```

##License##

LJURLRouter is available under the MIT license. See the LICENSE file for more info.

#中文介绍#

##为什么要造轮子##

开源社区已经有很多不错的router，但并不满足需求。

很多实现都是局限于controller和block，LJURLRouter主要是用于对象的映射，支持任意class.

##使用方法##

####注册URL和class的映射关系####

```
[[LJURLRouter sharedRouter] registerURL:YOUR_URL_FORMAT forClass:[YOUR_CLASS_NAME class]];
```

例子:

```
[[LJURLRouter sharedRouter] registerURL:@"/profile/:profile_id" forClass:[ProfileViewController class]];
```
####根据URL获得相应的对象实例####

```
id instance = [[LJURLRouter sharedRouter] instanceWithRouteURL:YOUR_URL_HERE];
```

例子:

```
id instance = [[LJURLRouter sharedRouter] instanceWithRouteURL:@"/profile/123?param1=hello&param2=world"];
```

####UIViewController Category####

提供了一个UIViewController的category，可以方便地进行controller之间的跳转

```
[controller openURL:@"/profile/123?param1=hello&param2=world"]
```

####其他特性####

- LJURLRouter支持默认schema

- 更详细的使用方法，可以看demo和单元测试

##安装##

可以直接把源码放到你的工程里，或者使用CocoaPods:

```
pod 'LJURLRouter'
```

##许可证##
MIT
