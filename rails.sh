#!/bin/bash
rails s -b 'ssl://localhost:3000?key=config/local-certs/localhost-key.pem&cert=config/local-certs/localhost.pem'
