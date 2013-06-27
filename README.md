sendgrid-cloudfoundry-rails
===========================


A sample application for using Ruby on Rails Framework and [SendGrid](http://www.sendgrid.com) on
[Cloud Foundry](http://www.cloudfoundry.com).

## Running the application on Cloud Foundry

After installing in the 'cf' [command-line interface for Cloud Foundry](http://docs.cloudfoundry.com/docs/using/managing-apps/cf/),
targeting a Cloud Foundry instance, and logging in, the application can be pushed using these commands:

~~~
$ git clone https://github.com/laur-craciun/sendgrid-cloudfoundry-rails.git
$ $ cd sendgrid-cloudfoundry-rails
$ cf push sendgrid-cloudfoundry-rails
~~~

If prompted to create a service for your app, select `y` and choose the SendGrid service. This will provision an
account on SendGrid and bind it to your app, which stores credentials for the account in the VCAP_SERVICES environment
variable. This application will read those credentials and use them when it sends e-mails.

Once the app is uploaded and finishes staging, you can browse to the URL
`http://sendgrid-cloudfoundry-rails.<cloud-foundry-domain>/`.

You can override the SendGrid credentials in the environment by configuring them in the file
`config/environment.rb`.

## Running the application locally

When running locally, the SendGrid credentials must be set manually in the file
`config/environment.rb`.

After editing the file and adding the credentials, run this command to start the app:

~~~
$rails s
~~~

Once the app is running you can browse to the URL `http://0.0.0.0:3000`.
