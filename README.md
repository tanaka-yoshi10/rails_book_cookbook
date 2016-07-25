ssh-keygen -t rsa -f ~/.ssh/login.pem
cp ~/.ssh/login.pem site-cookbooks/rails_book_cookbook/files/default/authorized_keys

bundle exec berks vendor cookbooks
vagrant up
