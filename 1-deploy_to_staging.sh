#!/bin/bash

if cd /home/zaintechmate/Documents/project-Chefpost; then
  if ssh -t -i "chefpost-nextjs.pem" ubuntu@ec2-44-230-57-52.us-west-2.compute.amazonaws.com '
    cd /var/www/html/frontend/ &&
    sudo git pull &&
    npm run build &&
    pm2 kill &&
    pm2 start "npm run dev" --name "Chefpost Staging"
  '; then
    echo "Script execution completed successfully."
  else
    echo "Error: Unable to execute remote commands." >&2
  fi
else
  echo "Error: Unable to change directory." >&2
fi

