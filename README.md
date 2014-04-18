# Toast

Toast is a Ruby on Rails frontend for creating static websites with Jekyll that can be automatically hosted for free on GitHub Pages.

Toast removes the barrier entry for creating a static site because you won't need to install Ruby, Jekyll, or have knowledge of Git to create a blog. All you need to do is sign up for an account, and click 'Create Site' and you will immediately be able to see your newly created website with sample posts.

Toast is currently in the early stages of development and there isn't a place to sign up yet.

## Local Development

* Fork this repo
* Clone to your development computer
* Create a `.password` and a `.username` file in the project root for your GitHub credentials (this process needs to be changed).
* Create a GitHub organization that will host the test sites it will create
* Change the source code where this test org is mentioned (this process also needs to be changed)
* Run the tests with `rspec spec`.
