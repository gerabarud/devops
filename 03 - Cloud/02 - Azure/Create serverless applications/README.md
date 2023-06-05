Create serverless applications

https://learn.microsoft.com/en-us/training/paths/create-serverless-applications/

## 	Introduction to Azure Functions 

### What is Azure Functions

Azure Functions is a cloud-based compute service. Functions provide event-driven and scalable serverless compute for Azure. In some cases, you’re only billed for the time your function code runs.

#### Use triggers to decide when to run code

Azure Functions lets you define triggers, which start the execution of your code. Triggers can also process inputs for passing data into your functions. Each function can have only one trigger. Some of the trigger types supported by Azure functions include:

- Storage: you can listen from events from databases like Azure Cosmos DB when a new row is inserted for example.
- Events: Event Grid and Event Hubs produce events that can trigger your code.
- HTTP, code can be triggered by Web requests and Web Hooks
- Queues, queue messages can be process as well.
- Timer, code can be invoked with a certain time interval.

Use bindings to connect to data sources. Bindings are ways to simplify coding for input and output data. While you can use client SDKs to connect to services from your function code, Functions provide bindings to simplify these connections. Essentially bindings are connection code you don’t have to write. You can integrate with many services on Azure and solve integration problems and automate business processes.

Bindings comes in two flavors, input, and output. An output binding provides a way to write data to the data source, for example, place a message on a queue or a new row in a database. Input bindings can be used to pass data to your function from a data source different than the one that triggered the function.
Features

#### There are some features that makes Azure Functions a compelling choice:
- 
- Flexible hosting plans. There are three different hosting plans to fit your business needs.
  - Consumption plan. This is the fully serverless hosting option for Functions. Functions scale automatically, and you pay for compute resources only when your functions are running. This plan provides cost-efficient compute for short process workloads that tend to be more intermittent with less-predictable loads.
  - Premium plan. In this plan, your functions are kept initialized, meaning there’s no delay after being idle. This is a good plan to choose when your function app needs to run for longer periods, but you still need the dynamic scale. This plan also lets you start scaling with more resources faster than with the Consumption plan. In the Consumption plan there’s also limits on the execution time, which this plan can supersede. While you still get the cost benefits of dynamic scale, you pay more
  - Dedicated plan. You run your functions with a regular App Service plan. It’s best for scenarios where your functions need to run continuously. Another benefit is that you fully control how the app scales and can more easily predict costs. This is also a good choice when you have an existing but underutilized App Service plan available.
  
- Dynamic scaling. In most plans, functions are dynamically scaled based on load. When demand of execution increases, more resources are allocated automatically to the service and when requests fall, resources and application instances drop off automatically. In Consumption plan, you don’t pay at all for idle functions.
  
- Event based architecture. Functions are meant to be small and focused and process incoming data and be done or raise a new event in turn. Some common usage areas of Azure functions are sending emails, starting backup, order processing, task scheduling such as database clean-up, sending notifications, messages, and IoT data processing.
  

### How Azure Functions works

Here, you’ll learn about how you can use Azure Functions to develop serverless architectures and make use of the various feature implementations provided by Functions.

You’ll also learn more about how Azure Functions work. This will also help you determine how you can best use Azure Functions to meet your organization's requirements.

**Azure Functions is a serverless compute solution that allows you to write less code. It’s a Platform as a Service offering so you don’t have to worry about hosting your app, and you save on costs.**

Azure Functions is a great solution for processing data, integrating systems, working with the internet-of-things (IoT), and building simple APIs and microservices.

#### Scaling function apps

**The context in which your functions run is called a function app. A function app is a unit of deployment, management, and scale for your functions. All function in a function app share the same setting and connections.**

In the Consumption and Premium plans, Functions scales CPU and memory resources by adding more function app instances. The number of instances is determined based on the number of events that trigger a function. All functions within a function app share resource within an instance and scale at the same time.

#### Azure Functions monitoring

**Azure Functions offers built-in integration with Azure Application Insights to monitor functions. Application Insights collects log, performance, and error data. It helps you detect performance anomalies, diagnose issues and better understand how your functions are used.**

Application Insights instrumentation is built into Azure Functions. With Application Insights integration, telemetry data is sent to your connected Application Insights instance. This data includes logs generated by the Functions host, traces written from your functions code, and performance data.

The following table describes the key components of Azure Functions:

- **Function triggers:** Triggers are what cause a function to run. A trigger defines how a function is invoked and a function must have exactly one trigger.
- F**unction bindings:** Binding to a function is a way of declaratively connecting another resource to the function; bindings may be connected as input bindings, output bindings, or both. Data from bindings is provided to the function as parameters. If you don’t want to or can’t use bindings, you can still use a client SDK in your functions as you normally would when connecting to services.
- **Function runtime:** Azure Functions currently supports several versions of the runtime host. Functions also support many different runtimes such as .NET Core, Node.js, Java, PowerShell and Python. During development, you can install the Functions runtime on your local computer and run functions locally by using the Azure Functions Core Tools.
- **API Management:** APIM provides security and routing for your HTTP triggered function endpoints as a way to expose them as a true REST API.
- **Deployment slots:** Azure Functions deployment slots allow your function app to run different instances called "slots". Slots are different environments exposed via a publicly available endpoint. Slots provide a way for you to test a new version of your functions in Azure in a safe environment and then seamlessly swap the new version into production.
- **Function app configuration:** Connection strings, environment variables, and other application settings are defined separately for each function app. The function app settings values can be read in the code as environment variables.

These components work together to provide a complete end-to-end platform for Application and DevOps Engineers to develop Serverless Architectures leveraging Azure Functions.

### When to use Azure Functions
     

As Azure Functions uses an event-based architecture, there are many interesting cases where such an architecture can be applied. Here’s a non-exhaustive list of scenarios suited for it:

- **Reminders and notifications.** Azure Functions has a trigger that can be instructed to run at certain intervals making it straight forward to implement such a scenario. You might have scenarios where getting a notification can be business critical.
- **Scheduled tasks.** Tasks that could use the same time-based triggers. In this case, there could be jobs that need to be done at certain intervals, for example, data cleaning or look for a piece of data.
- **Experimental APIs.** If you use the Consumption plan, with Functions, you can make millions of calls and pay very little. One thing to keep in mind is that any type of storage incurs a cost.
An example is writing to a database with a function. This plan is ideal to use for prototyping or for Start-ups. In the latter case, if you have so many calls to your functions that most likely means you have paying customers. Hence, Azure Functions scales with your business. As your business grows, you might consider other hosting plans as well.
- **Irregular but important business flows.** Getting a new customer and onboarding that customer is an example where your code has a good reason to run. Such a flow likely consists of operations like interacting with a data store, sending out emails, and more.
- **Queue based.** You might have a ticket selling app and requests needs to be processed in a queue like fashion.
- **Processing data in real-time.** If combined with Azure SignalR, Azure Functions can be made to process data on demand.
- **Analyze IoT stream.** It’s possible to collect and process data from IoT devices.
- **Process file uploads.** Run code when a file is uploaded or changed in a blob storage.
- **Serverless workflow.** A series of functions can be chained together, and you can introduce state which makes it possible to devise complex long running workflows via Durable Functions. Another choice for workflows is Logic apps that can monitor external events, perform branching logic and invoke functions as a result.

There are numerous other scenarios where Azure Functions makes sense to use, the above serves as inspiration how you can innovate in the cloud when applying an event-based reasoning and architecture.

## Choose the best Azure service to automate your business processes

### Identify the technology options
Business processes modeled in software are often called workflows. Azure includes four different technologies that you can use to build and implement workflows that integrate multiple systems:

 - Logic Apps
 - Microsoft Power Automate
 - WebJobs
 - Azure Functions

These four technologies have some similarities. For example:

- They can all accept inputs. An input is a piece of data or a file that is supplied to the workflow.
- They can all run actions. An action is a simple operation that the workflow executes and may often modify data or cause another action to be performed.
- They can all include conditions. A condition is a test, often run against an input, that may decide which action to execute next.
- They can all produce outputs. An output is a piece of data or a file that is created by the workflow.

In addition, workflows created with these technologies can either start based on a schedule or they can be triggered by some external event.

#### Design-first technologies

When business analysts discuss and plan a business process, they may draw a flow diagram on paper. With Logic Apps and Microsoft Power Automate, you can take a similar approach to designing a workflow. They both include user interfaces in which you can draw out the workflow. We call this approach a design-first approach.

##### Logic Apps

Logic Apps is a service within Azure to automate, orchestrate, and integrate disparate components of a distributed application. By using the design-first approach in Logic Apps, you can draw out complex workflows that model complex business processes.

One reason why Logic Apps is so good at integration is that over 200 connectors are included. A connector is a Logic Apps component that provides an interface to an external service. For example, the Twitter connector allows you to send and retrieve tweets, while the Office 365 Outlook connector lets you manage your email, calendar, and contacts. Logic Apps provides hundreds of pre-built connectors that you can use to create your apps. If you have an unusual or unique system that you want to call from Logic Apps, you can create your own connector if your system exposes a REST API.

##### Microsoft Power Automate

Microsoft Power Automate is a service to create workflows even when you have no development or IT Pro experience. You can create workflows that integrate and orchestrate many different components by using the website or the Microsoft Power Automate mobile app.

There are four different types of flow that you can create:

- Automated: Starts by a trigger from some event. For example, the event could be the arrival of a new tweet or a new file being uploaded.
- Button: Runs a repetitive task with a single click from your mobile device.
- Scheduled: Runs regularly. For example, once a week, on a specific date, or after 10 hours.
- Business process: Models a business process such as the stock ordering process or the complaints procedure. The flow process can have: notifications to required people; with their approval recorded; calendar dates for steps; and recorded time of flow steps.

Microsoft Power Automate provides an easy-to-use design surface to create these types of flows.

#### Code-first technologies
The developers on your team will likely prefer to write code when they want to orchestrate and integrate different business applications into a single workflow. This is the case when you need more control over the performance of your workflow or need to write custom code as part of the business process. For such people, Azure includes WebJobs and Functions.

##### WebJobs and the WebJobs SDK

The Azure App Service is a cloud-based hosting service for web applications, mobile back-ends, and RESTful APIs. These applications often need to perform some kind of background task. For example, in your bike rental system, when a user uploads a photo of a bike, you may need to generate a smaller thumbnail photograph.

WebJobs are a part of the Azure App Service that you can use to run a program or script automatically. There are two kinds of WebJob:

- Continuous. Starts immediately when the WebJob is created and runs in a continuous loop. For example, you could use a continuous WebJob to check a shared folder for a new photo.
- Triggered. Starts based on a binding event, on a schedule, or when you trigger it manually (on demand).

To determine what actions your WebJob takes, you can write code in several different languages. For example, you can script the WebJob by writing code in a Shell Script (Windows, PowerShell, Bash). Alternatively, you can write a program in PHP, Python, Java, or JavaScript.

You can also program a WebJob by using the .NET Framework or the .NET Core Framework and a .NET language such as C# or VB.NET. In this case, you can also use the WebJobs SDK to make the task easier. The SDK includes a range of classes, such as JobHostConfiguration and HostBuilder, which reduce the amount of code required to interact with the Azure App Service.

The WebJobs SDK only supports C# and the NuGet package manager.

##### Azure Functions

An Azure Function is a simple way for you to run small pieces of code in the cloud, without having to worry about the infrastructure required to host that code. You can write the Function in C#, Java, JavaScript, PowerShell, Python, or any of the languages that are listed in the Supported languages in Azure Functions article. In addition, with the consumption plan option, you only pay for the time when the code runs. Azure automatically scales your function in response to the demand from users.

When you create an Azure Function, you can start by writing the code for it in the portal. Alternatively, if you need source code management, you can use GitHub or Azure DevOps Services.

To create an Azure Function, choose from the range of templates. The following list is a sample of some of the templates available to you:

- HTTPTrigger. When you want the code to execute in response to a request sent through the HTTP protocol.
- TimerTrigger. When you want the code to execute according to a schedule.
- BlobTrigger. When you want the code to execute when a new blob is added to an Azure Storage account.
- CosmosDBTrigger. When you want the code to execute in response to new or updated documents in a NoSQL database.

Azure Functions can integrate with many different services both within Azure and from third parties. These services can trigger your function, or send data input to your function, or receive data output from your function.

### Analyze the decision criteria

#### How to choose a service

The following diagram shows a simplified flow chart that you can use to choose the best technology to use for your business process:
![How to choose a service](https://learn.microsoft.com/en-us/training/modules/choose-azure-service-to-integrate-and-automate-business-processes/media/3-service-choice-flow-diagram.png)

## Create serverless logic with Azure Functions 

### Introduction

Imagine that you work for an escalator company that has invested in IoT technology to monitor its product in the field. You oversee the processing of temperature sensor data from the drive gears of the escalators. You monitor the temperature data and add a data flag to indicate when the gears are too hot. In downstream systems, this data helps determine when maintenance is required.

Your company receives sensor data from several locations and from different escalator models. The data arrives in different formats, including batch file uploads, scheduled database pulls, messages on a queue, and incoming data from an event hub. You want to develop a reusable service that can process your temperature data from all these sources. Because elevator usage peaks at various times throughout the day and around the globe, the resources required for real-time processing vary throughout the day.

When designing a service such as this with traditional enterprise architecture strategies, you would need to consider server infrastructure and maintenance up front: scope out necessary hardware, plan to install it, coordinate with IT to manage it, and so on. An alternative to all that work is serverless computing. With serverless computing, your cloud provider manages the provisioning and maintenance of the infrastructure letting you focus completely on building the app logic. Azure Functions is a key component of the serverless computing offering from Azure and enables you to run pieces of code or functions, written in the programming language of your choice, in the cloud.

#### Learning objectives

In this module, you will:
- Decide if serverless computing is right for your business needs.
- Create an Azure function app in the Azure portal.
- Execute a function using triggers.
- Monitor and test your Azure function from the Azure portal.

### Decide if serverless computing is right for your business needs

#### What is serverless compute?

Serverless compute can be thought of as a function as a service (FaaS), or a microservice that is hosted on a cloud platform. Your business logic runs as functions and you don't have to manually provision or scale infrastructure. The cloud provider manages infrastructure. Your app is automatically scaled out or down depending on load. Azure has several ways to build this sort of architecture. The two most common approaches are Azure Logic Apps and Azure Functions, which is the focus off in this module.

#### What is Azure Functions?

Azure Functions is a serverless application platform. It enables developers to host business logic that can be executed without provisioning infrastructure. Azure Functions provides intrinsic scalability and you're charged only for the resources used. You can write your function code in the language of your choice, including C#, Java, JavaScript, Python, and PowerShell. Support for package managers like NuGet and npm is also included, so you can use popular libraries in your business logic.
Benefits of a serverless compute solution

Serverless compute is a great option for hosting business logic code in the cloud. With serverless offerings such as Azure Functions, you can write your business logic in the language of your choice. You get automatic scaling, you have no servers to manage, and you're charged based on what is used—not on reserved time. Here are some other characteristics of a serverless solution for you to consider.
Avoids over-allocation of infrastructure

Suppose you've provisioned virtual machine (VM) servers and configured them with enough resources to handle your peak load times. When the load is light, you're potentially paying for infrastructure you're not using. Serverless computing helps solve the allocation problem by scaling up or down automatically, and you're only billed when your function is processing work.
Stateless logic

Stateless functions are great candidates for serverless compute; function instances are created and destroyed on demand. If state is required, it can be stored in an associated storage service.
Event driven

Functions are event driven. They run only in response to an event (called a "trigger"), such as receiving an HTTP request, or a message being added to a queue. You configure a trigger as part of the function definition. This approach simplifies your code by allowing you to declare where the data comes from (trigger/input binding) and where it goes (output binding). You don't need to write code to watch queues, blobs, hubs, and so on. You can focus purely on the business logic.
Functions can be used in traditional compute environments

Functions are a key component of serverless computing, but they're also a general compute platform for executing any type of code. Should the needs of your app change, you can take your project and deploy it in a non serverless environment. That gives you the flexibility to manage scaling, run on virtual networks, and even completely isolate your functions.
Drawbacks of a serverless compute solution

Serverless compute, as provided by Azure Functions in the Consumption plan, won't always be the appropriate solution to hosting your business logic. Here are a few characteristics of functions that may affect your decision to host your services in serverless compute.
Execution time

By default, functions have a timeout of five (5) minutes. This timeout is configurable to a maximum of 10 minutes. If your function requires more than 10 minutes to execute, you can host it on a VM. Additionally, if your service is initiated through an HTTP request and you expect that value as an HTTP response, the timeout is further restricted to 2.5 minutes. However, there's also an option called Durable Functions that lets you orchestrate the executions of multiple functions without any timeout.
Execution frequency

Another characteristic is execution frequency. If you expect clients executing your function continuously, it would be prudent to estimate the usage and calculate the cost of using functions accordingly. It might be cheaper to host your service on a VM.

While scaling, only one function app instance can be created every 10 seconds, for up to 200 total instances. Keep in mind, each instance can service multiple concurrent executions, so there's no set limit about how much traffic a single instance can handle. Different types of triggers have different scaling requirements, so research your choice of trigger and investigate its limits.