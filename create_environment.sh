#!/bin/bash

# Creating the Environment...
echo "Setting up the Environment..."

# Deleting any possible existing files
rm -rf submission_reminder_app/modules/functions.sh
rm -rf submission_reminder_app/app/reminder.sh
rm -rf submission_reminder_app/config/config.env
rm -rf submission_reminder_app/assets/submissions.txt
rm -rf submission_reminder_app/assets/startup.sh

# Creating the submission reminder app directories
mkdir -p submission_reminder_app/{app,modules,assets,config}

# Creating the necessary files
touch submission_reminder_app/app/reminder.sh
touch submission_reminder_app/modules/functions.sh
touch submission_reminder_app/config/config.env
touch submission_reminder_app/assets/submissions.txt
touch submission_reminder_app/startup.sh

# Copying the submissions.txt file to the assets directory
cp "submissions.txt" "submission_reminder_app/assets/submissions.txt"

# Adding student records to the submissions.txt file
echo "Michael, Shell Navigation, not submitted" >> submission_reminder_app/assets/submissions.txt
echo "Kolapo, Shell Navigation, submitted" >> submission_reminder_app/assets/submissions.txt
echo "Ibrahim, Shell Navigation, not submitted" >> submission_reminder_app/assets/submissions.txt
echo "Wisdom, Shell Navigation, submitted" >> submission_reminder_app/assets/submissions.txt
echo "Samuel, Shell Navigation, submitted" >> submission_reminder_app/assets/submissions.txt

# Populating scripts required for the submission reminder app
cat reminder.sh >> submission_reminder_app/app/reminder.sh
cat functions.sh >> submission_reminder_app/modules/functions.sh
cat config.env >> submission_reminder_app/config/config.env

# Making required scripts for submission reminder app executable
chmod u+x submission_reminder_app/app/reminder.sh
chmod u+x submission_reminder_app/modules/functions.sh
chmod u+x submission_reminder_app/config/config.env

# Populating the startup.sh file programmatically
echo '#!/bin/bash' > submission_reminder_app/startup.sh
echo '' >> submission_reminder_app/startup.sh
echo '# Changing directory to the app directory' >> submission_reminder_app/startup.sh
echo 'cd submission_reminder_app' >> submission_reminder_app/startup.sh
echo '' >> submission_reminder_app/startup.sh
echo '# Sourcing the config file to load environment variables' >> submission_reminder_app/startup.sh
echo 'source ./config/config.env' >> submission_reminder_app/startup.sh
echo '' >> submission_reminder_app/startup.sh
echo '# Running the reminder function' >> submission_reminder_app/startup.sh
echo './app/reminder.sh' >> submission_reminder_app/startup.sh
echo '' >> submission_reminder_app/startup.sh
echo 'echo "Reminder app started successfully!"' >> submission_reminder_app/startup.sh

# Making the startup.sh executable
chmod u+x submission_reminder_app/startup.sh

# Done setting up the environment
echo "Enviroment creation is now successful!"

# Start the Reminder App
echo "Starting the Reminder App..."

bash submission_reminder_app/startup.sh
