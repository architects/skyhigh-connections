skyhigh-connections
===================

To customize main title/RSS url:
-

In the Project Navigator, select "Architect Reader-Info.plist", which is inside of the "Supporting Files" folder.

Edit the "Main Title" and "RSS URL" rows as desired

instructors notes: *.plist is an xml-encoded hash, you can stick arbitrary keys in it, I just added those keys in the default settings plist file and access them with e.g.

``` objective-c
[[NSBundle mainBundle] objectForInfoDictionaryKey:@"RSS URL"]
```

to customize icon/splash screen
-

1. Click on Images.xcassets
2. Click on AppIcon or LaunchImage

Each of those choices has multiple wells to drop new icons/launch images in, for the different uses.  I left the spotlight/settings ones empty because I think they just rescale for you, but it wouldn't hurt to drop images in those, too.  You can look up the appropriate resolutions online, but it looks like these days they just rescale it.  You need a 1024x and 512x version of your icon for the iTunes store.  I can provide those for the Arss logo I made, but that's just a placeholder so I figured you wouldn't care.
