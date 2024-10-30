Technologies: Spring Boot, Spring JDBC, SQL, AWS S3 

● Developed a Bank Aggregator application to integrate multiple banking services and generate a 
summarized banking statements. 

● Implemented RESTful APIs for seamless communication between client and server. 

● Utilised SQL for efficient data storage and management, ensuring data integrity and security. 

● Integrated AWS S3 for uploading and downloading bank statements. 

# UserController
## Register User
   Endpoint: POST http://localhost:8080/users/register
   
 **Request Body:**
 {
 "username": "chiranjeevi",
 "email": "chiranjeevi@example.com",
 "password": "passwordchiranjeevi@123",
 "company": {
   "companyId": 1
   }
 }
 
 **Response:**
 
 Success: User registered successfully!
 
 Failure: Company information is required or Company does not exist or User with username chiranjeevi already exists

## Login User
   Endpoint: POST http://localhost:8080/users/login
   
**Request Parameters:**
   username (String): The username of the user
   password (String): The password of the user
     Example:
         http://localhost:8080/users/login?username=chiranjeevu&password=passwordchiranjeevi@123
         
**Response:**

 Success: Login successful
 
 Failure: Invalid username or password.

## Get User by ID
   Endpoint: GET http://localhost:8080/users/{id}
   
**Request Path Variables:**
     id (Long): The ID of the user
       Example:
         http://localhost:8080/users/1
         
**Response:**

 {
 "userId": 1,
 "username": "john_doe",
 "email": "john@example.com",
 "company": {
   "companyId": 1,
   "companyName": "Example Company"
   }
 }

## Get All Users
   Endpoint: GET http://localhost:8080/users/all
   
 **Response:**
 
   [
     {
       "userId": 1,
       "username": "john_doe",
       "email": "john@example.com",
       "company": {
          "companyId": 1,
           "companyName": "Example Company"
           }
     },
     {
       "userId": 2,
       "username": "jane_doe",
       "email": "jane@example.com",
       "company": {
         "companyId": 1,
         "companyName": "Example Company"
         }
     }
  ]

# Company Controller
## Create Company
   Endpoint: POST http://localhost:8080/companies/create
   
**Request Body:**
   {
   "companyName": "New Company"
   }
   
**Response:**

 Success: Company created successfully!
 
 Failure: Company with name 'New Company' already exists.

## Get Company by ID
   Endpoint: GET http://localhost:8080/companies/{id}
   
**Request Path Variables:**
   id (Long): The ID of the company
   Example:
     http://localhost:8080/companies/1
     
**Response:**

   {
   "companyId": 1,
   "companyName": "Example Company
   }

## Get All Companies
   Endpoint: GET http://localhost:8080/companies/all
   Example:
     http://localhost:8080/companies/all
     
**Response:**

 [
   {
   "companyId": 1,
   "companyName": "Example Company"
   },
   {
   "companyId": 2,
   "companyName": "Another Company"
   }
 ]
 
# Branch Controller
## Create Branch
   Endpoint: POST http://localhost:8080/branches/create
    
**Request Body:**
 {
   "branchName": "New Branch",
   "company": {
     "companyId": 1
     }
 }
 
**Response:**

 Success: Branch created successfully!
 
 Failure: Company information is required or Company does not exist

## Get Branch by ID

**Request Path Variables:**
   Endpoint: GET http://localhost:8080/branches/{id}
   id (Long): The ID of the branch
   Example:
     http://localhost:8080/branches/1
     
**Response:**

 {
   "branchId": 1,
   "branchName": "Example Branch",
   "company": {
     "companyId": 1,
     "companyName": "Example Company"
    }
 }

## Get Branches by Company ID
   Endpoint: GET http://localhost:8080/branches/company/{companyId}
   
**Request Path Variables:**
   companyId (Long): The ID of the company
   Example:
     http://localhost:8080/branches/company/1
     
**Response:**

[
   {
   "branchId": 1,
   "branchName": "Branch A",
   "company": {
     "companyId": 1,
     "companyName": "Example Company"
     }
   },
   {
   "branchId": 2,
   "branchName": "Branch B",
   "company": {
     "companyId": 1,
     "companyName": "Example Company"
     }
   }
]

# Statement Controller
## Generate Bank Statement
   Endpoint: POST http://localhost:8080/statements/generate
   
**Request Parameters:**
   ● userId (Long): The ID of the user
   ● companyId (Long): The ID of the company
   ● branchId (Long): The ID of the branch
   ● transactionCount (int): The number of transactions to generate
   ● deleteAfterUpload (boolean): Flag to delete the file after upload
 
**Example**:
 http://localhost:8080/statements/generate?userId=1&companyId=1&branchId=1&transactionCount=10&deleteAfterUpload=true
 
**Response:**

 Success: URL of the uploaded file
 
 Failure: Error message

## Download Bank Statement
   Endpoint: GET http://localhost:8080/statements/download
 
**Request Parameters:**
   key (String): The key of the file in S3
   Example:
     http://localhost:8080/statements/download?key=company_1_user_1_1234567890.csv

**Response:**

 Success: Message indicating the file has been downloaded to the user's downloads folder
 
 Failure: Error message

## Parse Bank Statement
   Endpoint: POST http://localhost:8080/statements/parse
 
**Request Parameters:**
   filePath (String): The path of the file to parse
   Example:
     http://localhost:8080/statements/parse?filePath=/path/to/file.csv
     
**Response:**

 Success: Transactions parsed and saved successfully!
 
 Failure: Error message

