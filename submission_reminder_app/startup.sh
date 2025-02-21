#!/bin/bash

# Changing directory to the app directory
cd submission_reminder_app

# Sourcing the config file to load environment variables
source ./config/config.env

# Running the reminder function
./app/reminder.sh

echo "Reminder app started successfully!"
