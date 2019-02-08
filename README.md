# README

Hello! Thank you for taking the time to review my code!

You will need to go through these steps in order to set up the environment:

1. clone the repo using `git clone git@github.com:krodante/fountain.git`
2. run `bundle install`
3. run `rake db:setup` to create the database, run migrations, and load seed data
4. run tests with `rspec spec`
5. check code quality with `rubocop`
6. run `rails s` to view the applications at `localhost:3000` in the browser

In the application you're first sent to the welcome screen.
Click the **Log In** link to go to the main login page, and sign up by clicking the **Sign up** link.
Here you can choose if you are signing up as an **Applicant** or **Employer**.
### Applicants
* on sign up, applicants will be prompted to enter their **first name** and **last name**
* applicants can view what jobs they have applied to and will see a link to the **Jobs** page to apply for more positions
* if an applicant has already submitted an application for a particular job, the **Apply** link will be **disabled** in the **Jobs** index.

### Employers
* on sign up, employers will be prompted to enter their Company **name**
* employers view the jobs they have created and create new jobs in their portal
* employers can also see who has applied to their jobs
* employers cannot apply to jobs. The **Apply** link will always be **disabled** in the **Jobs** index for employers

___
Please contact me at <kathy.rodante@gmail.com> know if you have any questions or comments! Thank you again for your consideration!