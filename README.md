# README #

This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for? ###

Connecting to JSAPI using IOS Swift

### How do I get set up? ###

1-Checkout JSAPI IOS SDK 
2-Go to JSAPI SDK Folder 
3-Drag and Drop JsapiApi.xcodeproj to your project 
4-Select your project /target /Build phases /Link Binary With Libraries 
5-Click on Plus icon then add JsapiApi.framework 
6-Go to your appDelegate add this line in top of your class  import JsapiApi
7-Initialise Jsapi Object by adding this line in didFinishLaunchingWithOptions function it should be like this 
JsapiAPi.jsapiInit(JSAPI URL, client_id: "client_id",secrect_key: "optional")

AppDelegate
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        JsapiAPi.jsapiInit("http://localhost:8080/jsapi", client_id: "teamrock_web",secrect_key: "Caqq24dp68VCU")
        // Override point for customization after application launch.
        return true
    }
### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###

* Repo owner or admin
* Other community or team contact