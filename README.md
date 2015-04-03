### JSAPI SDK For IOS  ###
Connecting to JSAPI using IOS Swift
### How do I get set up? ###

1-Checkout JSAPI IOS SDK 

2-Go to JSAPI SDK Folder

3-Drag and Drop JsapiApi.xcodeproj to your project

4-Select your project /target /Build phases /Link Binary With Libraries

5-Click on Plus icon then add JsapiApi.framework

6-Go to your appDelegate add this line in top of your class   import JsapiApi 

7-Initialise Jsapi Object by calling jsapiInit in didFinishLaunchingWithOptions method in AppDelegate

func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool

{

 JsapiAPi.jsapiInit("http://localhost:8080/jsapi", client_id: "teamrock_web",secrect_key: "Caqq24dp68VCU")

  return true

 }

### Getting Started ###

1-Go to SDK Folder and open JsapiApiWorkSpace.xcworkspace 

2-Under JsapiApiTest open ViewController.swift 

3-Search For your function Name for Example if you want to do  Userlogin the Test function Name is testDoLogin 

4-Copy testDoLogin function to your application and change the Dictionary Parameters

userDetails["username"] = username

userDetails["password"] = password

### Login Example ###
  
@IBAction func testDoLogin()

    {

        var userDetails=Dictionary<String,String>()

        userDetails["username"] = username

        userDetails["password"] = password

        JsapiAPi.sharedInstance.doUserLogin(userDetails)
        {

        (result:NSDictionary,issuccess:Bool) in

            if(!issuccess)
            {

                println("testDoLogin Failed")

            }else

            {

                println("testDoLogin PASS")

            }

        }
     
    }