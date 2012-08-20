A toy application to test the conventions and configurations of the FW1 framework.

Purpose of tag v.0.0.6_di1:
* Use DI/1 for dependency injection instead of ServiceFactory.cfc
* Secure application, showing login form by default when not logged in

Difference between tag v.0.0.6 and tag v.0.0.6_d1i:
* Add D1/1 (ioc.cfc) to the /fw1toy/model directory

Application.cfc
* Change setupApplication() to instantiate Di/1
* Remove ServiceFactory.cfc from setupApplication()

Model/beans/main.cfc
* Move model/services/main.cfc to new location
