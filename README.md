# spring-boot-graalvm-flyway-issue

```shell
$ ./mvnw -Pnative spring-boot:build-image -DskipTests -DdockerImageName=spring-boot-graalvm-flyway-issue
$ docker compose up
```

Error:

```shell
spring-boot-graalvm-flyway-issue  | 2024-08-30T06:59:30.188Z  WARN 1 --- [spring-boot-graalvm-flyway-issue] [           main] w.s.c.ServletWebServerApplicationContext : Exception encountered during context initialization - cancelling refresh attempt: org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'entityManagerFactory': Failed to initialize dependency 'flyway' of LoadTimeWeaverAware bean 'entityManagerFactory': Error creating bean with name 'flyway': Instantiation of supplied bean failed
spring-boot-graalvm-flyway-issue  | 2024-08-30T06:59:30.193Z  INFO 1 --- [spring-boot-graalvm-flyway-issue] [           main] o.apache.catalina.core.StandardService   : Stopping service [Tomcat]
spring-boot-graalvm-flyway-issue  | Application run failed
spring-boot-graalvm-flyway-issue  | org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'entityManagerFactory': Failed to initialize dependency 'flyway' of LoadTimeWeaverAware bean 'entityManagerFactory': Error creating bean with name 'flyway': Instantiation of supplied bean failed
spring-boot-graalvm-flyway-issue  |     at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:325)
spring-boot-graalvm-flyway-issue  |     at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:204)
spring-boot-graalvm-flyway-issue  |     at org.springframework.context.support.AbstractApplicationContext.finishBeanFactoryInitialization(AbstractApplicationContext.java:970)
spring-boot-graalvm-flyway-issue  |     at org.springframework.context.support.AbstractApplicationContext.refresh(AbstractApplicationContext.java:627)
spring-boot-graalvm-flyway-issue  |     at org.springframework.boot.web.servlet.context.ServletWebServerApplicationContext.refresh(ServletWebServerApplicationContext.java:146)
spring-boot-graalvm-flyway-issue  |     at org.springframework.boot.SpringApplication.refresh(SpringApplication.java:756)
spring-boot-graalvm-flyway-issue  |     at org.springframework.boot.SpringApplication.refreshContext(SpringApplication.java:443)
spring-boot-graalvm-flyway-issue  |     at org.springframework.boot.SpringApplication.run(SpringApplication.java:319)
spring-boot-graalvm-flyway-issue  |     at org.springframework.boot.SpringApplication.run(SpringApplication.java:1365)
spring-boot-graalvm-flyway-issue  |     at org.springframework.boot.SpringApplication.run(SpringApplication.java:1354)
spring-boot-graalvm-flyway-issue  |     at com.sivalabs.myapp.SpringBootGraalvmFlywayIssueApplication.main(SpringBootGraalvmFlywayIssueApplication.java:10)
spring-boot-graalvm-flyway-issue  |     at java.base@21.0.3/java.lang.invoke.LambdaForm$DMH/sa346b79c.invokeStaticInit(LambdaForm$DMH)
spring-boot-graalvm-flyway-issue  | Caused by: org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'flyway': Instantiation of supplied bean failed
spring-boot-graalvm-flyway-issue  |     at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.obtainFromSupplier(AbstractAutowireCapableBeanFactory.java:1239)
spring-boot-graalvm-flyway-issue  |     at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBeanInstance(AbstractAutowireCapableBeanFactory.java:1176)
spring-boot-graalvm-flyway-issue  |     at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.doCreateBean(AbstractAutowireCapableBeanFactory.java:563)
spring-boot-graalvm-flyway-issue  |     at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.createBean(AbstractAutowireCapableBeanFactory.java:523)
spring-boot-graalvm-flyway-issue  |     at org.springframework.beans.factory.support.AbstractBeanFactory.lambda$doGetBean$0(AbstractBeanFactory.java:336)
spring-boot-graalvm-flyway-issue  |     at org.springframework.beans.factory.support.DefaultSingletonBeanRegistry.getSingleton(DefaultSingletonBeanRegistry.java:296)
spring-boot-graalvm-flyway-issue  |     at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:334)
spring-boot-graalvm-flyway-issue  |     at org.springframework.beans.factory.support.AbstractBeanFactory.getBean(AbstractBeanFactory.java:199)
spring-boot-graalvm-flyway-issue  |     at org.springframework.beans.factory.support.AbstractBeanFactory.doGetBean(AbstractBeanFactory.java:312)
spring-boot-graalvm-flyway-issue  |     ... 11 more
spring-boot-graalvm-flyway-issue  | Caused by: org.graalvm.nativeimage.MissingReflectionRegistrationError: The program tried to reflectively invoke method public boolean org.flywaydb.core.internal.publishing.PublishingConfigurationExtension.isPublishResult() without it being registered for runtime reflection. Add public boolean org.flywaydb.core.internal.publishing.PublishingConfigurationExtension.isPublishResult() to the reflection metadata to solve this problem. See https://www.graalvm.org/latest/reference-manual/native-image/metadata/#reflection for help.
spring-boot-graalvm-flyway-issue  |     at org.graalvm.nativeimage.builder/com.oracle.svm.core.reflect.MissingReflectionRegistrationUtils.forQueriedOnlyExecutable(MissingReflectionRegistrationUtils.java:72)
spring-boot-graalvm-flyway-issue  |     at java.base@21.0.3/java.lang.reflect.Method.acquireMethodAccessor(Method.java:77)
spring-boot-graalvm-flyway-issue  |     at java.base@21.0.3/java.lang.reflect.Method.invoke(Method.java:577)
spring-boot-graalvm-flyway-issue  |     at com.fasterxml.jackson.databind.ser.BeanPropertyWriter.serializeAsField(BeanPropertyWriter.java:688)
spring-boot-graalvm-flyway-issue  |     at com.fasterxml.jackson.databind.ser.std.BeanSerializerBase.serializeFields(BeanSerializerBase.java:770)
spring-boot-graalvm-flyway-issue  |     at com.fasterxml.jackson.databind.ser.BeanSerializer.serialize(BeanSerializer.java:183)
spring-boot-graalvm-flyway-issue  |     at com.fasterxml.jackson.databind.ser.DefaultSerializerProvider._serialize(DefaultSerializerProvider.java:502)
spring-boot-graalvm-flyway-issue  |     at com.fasterxml.jackson.databind.ser.DefaultSerializerProvider.serializeValue(DefaultSerializerProvider.java:341)
spring-boot-graalvm-flyway-issue  |     at com.fasterxml.jackson.databind.ObjectMapper._writeValueAndClose(ObjectMapper.java:4799)
spring-boot-graalvm-flyway-issue  |     at com.fasterxml.jackson.databind.ObjectMapper.writeValueAsString(ObjectMapper.java:4040)
spring-boot-graalvm-flyway-issue  |     at org.flywaydb.core.extensibility.ConfigurationExtension.copy(ConfigurationExtension.java:42)
spring-boot-graalvm-flyway-issue  |     at java.base@21.0.3/java.util.stream.ReferencePipeline$3$1.accept(ReferencePipeline.java:197)
spring-boot-graalvm-flyway-issue  |     at java.base@21.0.3/java.util.ArrayList$ArrayListSpliterator.forEachRemaining(ArrayList.java:1708)
spring-boot-graalvm-flyway-issue  |     at java.base@21.0.3/java.util.stream.AbstractPipeline.copyInto(AbstractPipeline.java:509)
spring-boot-graalvm-flyway-issue  |     at java.base@21.0.3/java.util.stream.AbstractPipeline.wrapAndCopyInto(AbstractPipeline.java:499)
spring-boot-graalvm-flyway-issue  |     at java.base@21.0.3/java.util.stream.AbstractPipeline.evaluate(AbstractPipeline.java:575)
spring-boot-graalvm-flyway-issue  |     at java.base@21.0.3/java.util.stream.AbstractPipeline.evaluateToArrayNode(AbstractPipeline.java:260)
spring-boot-graalvm-flyway-issue  |     at java.base@21.0.3/java.util.stream.ReferencePipeline.toArray(ReferencePipeline.java:616)
spring-boot-graalvm-flyway-issue  |     at java.base@21.0.3/java.util.stream.ReferencePipeline.toArray(ReferencePipeline.java:622)
spring-boot-graalvm-flyway-issue  |     at java.base@21.0.3/java.util.stream.ReferencePipeline.toList(ReferencePipeline.java:627)
spring-boot-graalvm-flyway-issue  |     at org.flywaydb.core.internal.plugin.PluginRegister.getCopy(PluginRegister.java:109)
spring-boot-graalvm-flyway-issue  |     at org.flywaydb.core.api.configuration.ClassicConfiguration.configure(ClassicConfiguration.java:1699)
spring-boot-graalvm-flyway-issue  |     at org.flywaydb.core.api.configuration.ClassicConfiguration.<init>(ClassicConfiguration.java:158)
spring-boot-graalvm-flyway-issue  |     at org.flywaydb.core.Flyway.<init>(Flyway.java:129)
spring-boot-graalvm-flyway-issue  |     at org.flywaydb.core.api.configuration.FluentConfiguration.load(FluentConfiguration.java:65)
spring-boot-graalvm-flyway-issue  |     at org.springframework.boot.autoconfigure.flyway.FlywayAutoConfiguration$FlywayConfiguration.flyway(FlywayAutoConfiguration.java:179)
spring-boot-graalvm-flyway-issue  |     at org.springframework.boot.autoconfigure.flyway.FlywayAutoConfiguration__BeanDefinitions$FlywayConfiguration.lambda$getFlywayInstanceSupplier$3(FlywayAutoConfiguration__BeanDefinitions.java:141)
spring-boot-graalvm-flyway-issue  |     at org.springframework.util.function.ThrowingBiFunction.apply(ThrowingBiFunction.java:68)
spring-boot-graalvm-flyway-issue  |     at org.springframework.util.function.ThrowingBiFunction.apply(ThrowingBiFunction.java:54)
spring-boot-graalvm-flyway-issue  |     at org.springframework.beans.factory.aot.BeanInstanceSupplier.lambda$get$2(BeanInstanceSupplier.java:206)
spring-boot-graalvm-flyway-issue  |     at org.springframework.util.function.ThrowingSupplier.get(ThrowingSupplier.java:58)
spring-boot-graalvm-flyway-issue  |     at org.springframework.util.function.ThrowingSupplier.get(ThrowingSupplier.java:46)
spring-boot-graalvm-flyway-issue  |     at org.springframework.util.function.ThrowingSupplier.get(ThrowingSupplier.java:58)
spring-boot-graalvm-flyway-issue  |     at org.springframework.util.function.ThrowingSupplier.get(ThrowingSupplier.java:46)
spring-boot-graalvm-flyway-issue  |     at org.springframework.beans.factory.support.SimpleInstantiationStrategy.instantiateWithFactoryMethod(SimpleInstantiationStrategy.java:88)
spring-boot-graalvm-flyway-issue  |     at org.springframework.beans.factory.aot.BeanInstanceSupplier.invokeBeanSupplier(BeanInstanceSupplier.java:216)
spring-boot-graalvm-flyway-issue  |     at org.springframework.beans.factory.aot.BeanInstanceSupplier.get(BeanInstanceSupplier.java:206)
spring-boot-graalvm-flyway-issue  |     at org.springframework.beans.factory.support.DefaultListableBeanFactory.obtainInstanceFromSupplier(DefaultListableBeanFactory.java:977)
spring-boot-graalvm-flyway-issue  |     at org.springframework.beans.factory.support.AbstractAutowireCapableBeanFactory.obtainFromSupplier(AbstractAutowireCapableBeanFactory.java:1233)
```