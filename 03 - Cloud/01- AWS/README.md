## AWS Technical Essentials
https://explore.skillbuilder.aws/learn/course/1851

### AWS Global Infrastructure

- **Regions:** AWS has numerous regions located in different parts of the world. Each region is isolated from others and designed to provide high availability and fault tolerance. 
In order to choosing the right AWS Region, you must consider: 
    - Latency
    - Pricing
    - Service Availability
    - Data Compliance

- **Availability Zones (AZs):** Within each region, there are multiple availability zones. An availability zone typically consists of one or more data centers, each with redundant power, networking, and cooling infrastructure. These availability zones are physically separate from each other and connected through low-latency links.

- **Edge Locations (cache):** In addition to regions and availability zones, AWS has a global network of edge locations. Edge locations are smaller data centers that are distributed around the world to bring content closer to end-users. These locations are used by AWS services like Amazon CloudFront (a content delivery network) to cache and deliver content with low latency.

- **Global Network:** AWS has built a global network infrastructure called AWS Global Accelerator, which helps improve the performance and availability of applications. It uses the AWS global network backbone to route traffic from end-users to the closest AWS edge location or directly to the application hosted in an AWS region.

- **Services Availability:** While most AWS services are available across all regions, some services might have specific regional limitations or be initially launched in specific regions before expanding to others. 


EC2
-> Instances
-> Load Balancers
-> AutoScaling Groups

VPCs
-> Connectivity
-> Routing
-> Gateways
-> Subnetting

S3 Storage

IAM
-> Users
-> Groups
-> Policies
-> Roles

DATABASES
-> RDS
-> Aurora
-> Dynamodb

LAMBDA
-> Creating Serverless Scripts
