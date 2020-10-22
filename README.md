<h1>Freelance Expense Tracker</h1>

When tax season comes around, are you always scrambling through your inbox of expense receipts, bank statements, and meticulously sifting through emails and your planner to recount the freelance work that you did for that year?

Here is a handy tool that can be utilized by all freelancers, to keep track of all your gigs and expenses. 

This sinatra application was created as a project requirement for the <a href="https://flatironschool.com/career-courses/coding-bootcamp/online">Flatiron Online Software Engineering Program</a>.

For more information, check out my blog and a walkthrough demonstration of this project.

A MVC sinatra application that uses:
<ul>
    <li> Sqlite database
    <li> ActiveRecord
    <li> RESTful routes
    <l1> Sessions
    <li> Signup/Login/Logout 
    <li> ORM - Object Relational Mapping
        - belongs_to
        - has_many
    <l1> CRUD functionality:
        - Create
        - Read
        - Update
        - Delete
    <li> Helper methods to protect the views of the current_user. Only the logged_in user should be allowed to create, read, update, and delete their own gigs
    <li> Validations
    <li> Flash error messages
</ul>

<h2>Instructions</h2>
<ul>
    <li> Clone <a href="https://github.com/gracenak/freelance_expense_tracker.git">this repo</a>
    <l1> Run 'bundle install'
    <li> Run 'rake db:migrate' # migrates the tables into the database
    <li> Run 'rake db:seed'    # migrates this seed file containing initial data to test the application with
    <li> Start running the server with 'shotgun' and visit <a href="https://http://localhost:9393/"></a> to visit the homepage.
    <li> Enjoy!
</ul>
