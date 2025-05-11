#!/bin/bash
echo "Rendering site..."
quarto render

echo "Adding changes..."
git add .

echo "Enter commit message: "
read msg
git commit -m "$msg"

echo "Pushing to GitHub..."
git push origin main

echo "✅ Done: site rendered and pushed!"
