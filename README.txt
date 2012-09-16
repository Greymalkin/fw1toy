A toy application to test the conventions and configurations of the FW1 framework.

Purpose of tag v.0.0.7:
* Secure application, showing login form by default when not logged in
* Save page user requested when were redirected to login form
* Save user data / login data in session

Difference between tag v.0.0.6 and tag v.0.0.7:
* Add D1/1 (ioc.cfc) to the /fw1toy/model directory
* Use of session scope for persisted data

Model/beans/main.cfc
* Move model/services/main.cfc to new location

Model/managers/beans/user_sampledata.cfc
* Mocking up a set of User data

Model/managers/beans/user.cfc
* Checks login form against sample user data
* Sets data into session scope
* Sample User Data injected as a dependency

Authentication Subsystem
Auth/Controllers/main.cfc
* Added security routine that forces user to view a login form unless they are on a page that is excluded from being secured
* Borrowed security routine from  http://www.aliaspooryorik.com/blog/index.cfm/e/posts.details/post/simple-security-in-fw-1-336
* Enhanced login
* Added logout
* Added a redirect after successful login to the original page you were looking for prior to login
* User Manager injected as a dependency

Toy Subsystem
Toy/controllers/main.cfc
* Still nothing substantive, just changing the cfc so that mainbean is autowired via DI/1