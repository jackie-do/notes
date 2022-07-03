
## Step 1: Create Bucket
- Create bucket with a strictly correct name with your domain like `staging.xxx.com`
- Allow Public Access

## Step 2: Update properties to set this bucket as a statis host
- Select the bucket then switch to tab `Properties`
- Scroll down to `Static website hosting`, click `Edit` 
  - Static website hosting: Enable
  - Hosting type: Host a static website
  - Index document: index.html
  - Error document: index.html

## Step 3: Update permissions to allow all requests to be accessible
- Select the bucket then switch to tab `Permissions`
- Scroll down to `Bucket policy`, update as the bellow 
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::<your bucket name>/*"
        }
    ]
}
```

## Step 4: Deploy all files of the `build` directory of react code to s3 as root directory
