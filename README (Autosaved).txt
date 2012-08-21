A toy application to test the conventions and configurations of the FW1 framework.

Purpose of tag v.0.0.6_di1:
* Use DI/1 for dependency injection instead of ServiceFactory.cfc
* Secure application, showing login form by default when not logged in

Difference between tag v.0.0.6 and tag v.0.0.6_d1i:
* Add D1/1 (ioc.cfc) to the /fw1toy/model directory

Application.cfc
* Change setupApplication() to instantiate Di/1
* Remove ServiceFactory.cfc from setupApplication()
* Add setupRequest() to force authentication

Model/beans/main.cfc
* Move model/services/main.cfc to new location

Authentication Subsystem
Auth/Controllers/main.cfc
* Added security routine that forces user to view a login form unless they are on a page that is excluded from being secured
* Borrowed security routine from  http://www.aliaspooryorik.com/blog/index.cfm/e/posts.details/post/simple-security-in-fw-1-336
