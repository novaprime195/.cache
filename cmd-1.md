# Install Git (if not already installed)
sudo apt-get install git

# Create a directory for the Git demo and initialize a bare repository
mkdir -p ~/git-demo && cd ~/git-demo
git init --bare central-repo.git

# Clone the bare repository for team lead and coders
git clone central-repo.git team_lead
git clone central-repo.git coder1
git clone central-repo.git coder2

# Configure Git user details for team lead
cd ~/git-demo/team_lead
git config user.name "Team Lead"
git config user.email "lead@example.local"

# Configure Git user details for coder1
cd ../coder1
git config user.name "Coder One"
git config user.email "coder1@example.local"

# Configure Git user details for coder2
cd ../coder2
git config user.name "Coder Two"
git config user.email "coder2@example.local"

# Verify Git user details
git config user.name   # prints configured name
git config user.email

# Team lead creates an initial file and pushes it to the central repository
cd ~/git-demo/team_lead
mkdir src && echo "print('Hello world')" > src/main.py
git add .
git commit -m "Initial commit: add main.py"
git push origin master

# Coder1 creates a feature branch and makes changes
cd ~/git-demo/coder1
git pull origin master
git checkout -b feature/ui-improvement
echo "# UI improvements" >> src/main.py
git add src/main.py
git commit -m "Feature: UI improvements by Coder One"
git push origin feature/ui-improvement

# Coder2 creates a feature branch and makes changes
cd ~/git-demo/coder2
git pull origin master
git checkout -b feature/add-logging
echo "\nprint('Logging enabled')" >> src/main.py
git add src/main.py
git commit -m "Feature: add logging by Coder Two"
git push origin feature/add-logging

# Team lead reviews and merges coder1's branch
cd ~/git-demo/team_lead
git fetch origin
git branch -r
git checkout -b review-ui origin/feature/ui-improvement
git diff origin/master..origin/feature/ui-improvement
git checkout master
git pull origin master
git merge --no-ff review-ui -m "Merge feature/ui-improvement (reviewed)"
git push origin master

# Team lead reviews and merges coder2's branch
git fetch origin
git checkout -b review-logging origin/feature/add-logging
git checkout master
git merge --no-ff review-logging -m "Merge feature/add-logging (reviewed)"
git push origin master

# Check the status of the repository
git status

# Edit and commit changes to src/main.py
nano src/main.py
git add src/main.py
git commit
git push origin master

git status

# Simulate a fork for coder1
cd ~/git-demo
git clone central-repo.git coder1-fork
cd coder1-fork
git config user.name "Coder One Fork"

# Fetch and compare branches
git fetch origin
git diff origin/master..origin/feature/add-logging

# Coder1 creates a branch to simulate a conflict
cd ~/git-demo/coder1
git checkout -b feature/conflict-test
sed -n '1,100p' src/main.py
printf "print('Hello from Coder One')\n" > src/main.py
git add src/main.py
git commit -m "Coder One: change greeting"
git push origin feature/conflict-test

# Coder2 creates a conflicting branch
cd ~/git-demo/coder2
git checkout -b feature/conflict-test
printf "print('Hello from Coder Two')\n" > src/main.py
git add src/main.py
git commit -m "Coder Two: change greeting"

# Verify branches
git branch
git checkout -b feature/conflict-test-c2
git branch
git push origin feature/conflict-test-c2

# Team lead resolves the conflict
cd ~/git-demo/team_lead
git fetch origin
git checkout master
git merge origin/feature/conflict-test-c2
nano sr/main.py
git add src/main.py
git commit -m "Merge resolved: src/main.py"
git push origin master

# Rebase feature branch onto master
git fetch origin
git checkout feature/x
git rebase origin/master
git rebase --continue
nano src/main.py
git add src/main.py
git commit -m "Resolve conflict between coder1 and coder2 greetings"
git push origin master

# Force push after rebase
git fetch origin
git checkout feature/x
git rebase origin/master
git push --force-with-lease origin feature/x

# Check repository status
git status
git rebase --continue
git branch
git fetch origin
nano src/main.py
git pull origin master
git push origin master
git pull --rebase origin master
git rebase --continue
git push origin master