== README

* Ruby version
Rails 4.2.5

* How to run the test suite
rspec spec

* Details of the App
Teleioo is a an application that helps you keep track of your weekly tasks.
These tasks are self destructing which means if you don't complete them in a weeks time, they auto delete.
Motivational quotes on the tasks page keep you motivated in completing your tasks. :) 

* Device Gem: For authorization.

* Rake Task: (lib/tasks/todo.rake)
"delete_items" is schdeuled to run every day to check and delete tasks that are more than 7 days old.