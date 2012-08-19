A toy application to test the conventions and configurations of the FW1 framework.

Purpose of tag v.0.0.4_di1:
* Use DI/1 for dependency injection instead of ServiceFactory.cfc

Difference between tag v.0.0.4 and tag v.0.0.4_d1i:
* Add D1/1 (ioc.cfc) to the /fw1toy/model directory

Application.cfc
* Change setupApplication() to instantiate Di/1
* Remove ServiceFactory.cfc from setupApplication()

Controllers/main.cfc
* Add accessors=true to the component definition
* Rewrite the dependency injection test in main()

Model/beans/main.cfc
* Move model/services/main.cfc to new location
* Make small modification to the value of setFromService variable, just to be able to prove that stuff changed, because I'm paranoid like that.