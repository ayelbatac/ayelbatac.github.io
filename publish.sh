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

echo "Opening site in browser..."
open https://ayelbatac.github.io/

echo "✅ Done: site rendered, pushed, and opened!"
