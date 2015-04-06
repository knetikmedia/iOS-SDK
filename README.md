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


```
#!swift

func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
{
 JsapiAPi.jsapiInit("http://localhost:8080/jsapi", client_id: "teamrock_web",secrect_key: "Caqq24dp68VCU")
  return true
 }
```


### client_Id ###

is the top client name in client table 

# Getting Started #
once you add JsapiAPi.jsapiInit call in AppDelegate a singleton Object for JsapiAPi class created 

## JsapiAPi##
JsapiAPi class used to perform Login, logout functions and caching the Authentication token , jsapi URL and client_id

### Login ###
Right now you have an Object of JsapiAPi so all you need to do is to call doUserLogin function and pass the username and password parameters as shown in below Example 


```
#!swift

func testDoLogin()
    {
        var userDetails=Dictionary<String,String>()
        userDetails["username"] = username
        userDetails["password"] = password
        JsapiAPi.sharedInstance.doUserLogin(userDetails)
        {
        (result:NSDictionary,issuccess:Bool) in
            if(!issuccess)
            {
             // Login Failed
            }else
            {
            // Login Success
            }
        }
 }
```
### Login Result  ###
in case of succeed Login you don't need to take care of login response because Api is caching the token and token type for you 
and you can access it by calling *JsapiAPi.sharedInstance.getJsapiToken()*
```
#!json
({
  "access_token": "5716a78e-6afe-4ba5-ace7-6ce285545f80",
  "token_type": "bearer",
  "expires_in": 3600,
  "scope": "write read"
})
```
### Login Failed ###
in case of failed login you need to show to the user the error_description message 

```
#!json

Optional({
  "error": "invalid_grant",
  "error_description": "Bad credentials"
})
```

### Logout ###
you can clearing your cached token and token type by calling doUserLogout function as shown in this example 

```
#!swift

func testLogout()
    {
        JsapiAPi.sharedInstance.doUserLogout()
    }

```

## User ##
User class used to Get and Update User Info

### Get User Info ###
you can get User Info be calling getUserInfo function from User Object 


```
#!swift

func testGetUserInfo()
    {
        var emptyParams=Dictionary<String,String>()
        var userObject = User()
        userObject.getUserInfo(emptyParams)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testGetUserInfo Failed")
                }else
                {
                    println("testGetUserInfo PASS")
                    // Valid Response
                }
                println(result)
        }
    }
```
### User Info Response ### 

```
#!json
{
    cachable = 0;
    cached = 0;
    code = "<null>";
    error =     {
        code = 0;
        success = 1;
    };
    message = "";
    parameters =     (
    );
    requestId = "1428344143683-1453";
    result =     {
        age = 0;
        "avatar_url" = lala;
        country = "United States";
        "date_of_birth" = "<null>";
        email = "meyoussef@knetik.com";
        "first_name" = "<null>";
        fullname = yossussefm2aher;
        gender = male;
        id = 7700;
        inventory = "<null>";
        lang = "<null>";
        "last_name" = "<null>";
        "mobile_number" = "<null>";
        "product_item" = "<null>";
        token = "<null>";
        username = meyoussef;
        wallet =         (
                        {
                balance = 0;
                code = GBP;
                "currency_name" = "British Pound";
                id = 6859;
            },
                        {
                balance = 0;
                code = GOL;
                "currency_name" = Gold;
                id = 6860;
            },
                        {
                balance = 0;
                code = SIL;
                "currency_name" = Silver;
                id = 6861;
            },
                        {
                balance = 0;
                code = SK;
                "currency_name" = Skulls;
                id = 6862;
            },
                        {
                balance = 0;
                code = SP;
                "currency_name" = "Silver Picks";
                id = 6863;
            }
        );
    };
}
```
### Update User Info ###
you can update some user Info by passing configName and configValue to updateUserInfo function as shown in below example 

```
#!swift

func testUpdateUser()
    {
        var userDetails=Dictionary<String,String>()
        userDetails["configValue"]="knetik"
        userDetails["configName"]="display_name"

        var userObject = User()
        userObject.updateUserInfo(userDetails)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    println("testUpdateUser Failed")
                }else
                {
                    println("testUpdateUser PASS")
                    // Valid Response
                }
                println(result)
        }
    }
```
### List of Configuration Names for Update ### 
1-avatar

2-display_name

3-lang and

4-date_of_birth format yyyy-[m]m-[d]d hh:mm:ss

