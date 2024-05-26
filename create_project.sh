#!/bin/bash

# Directory name (replace with your desired name)
dir_name="my_project"

# File names (replace with your desired names)
html_file="index.html"
css_file="styles.css"
js_file="script.js"

# Create the directory
if [[ ! -d "$dir_name" ]]; then
  mkdir "$dir_name"
  echo "Directory '$dir_name' created."
else
  echo "Directory '$dir_name' already exists."
fi

# Create the HTML file (basic content)
echo "<!DOCTYPE html>
<html lang='en'>
<head>
  <meta charset='UTF-8'>
  <title>My Project</title>
  <link rel='stylesheet' href='$css_file'>
</head>
<body>
  <h1>Welcome to my project!</h1>
  <script src='$js_file'></script>
</body>
</html>" > "$dir_name/$html_file"

# Create the CSS file (empty)
touch "$dir_name/$css_file"

# Create the JS file (empty)
touch "$dir_name/$js_file"

echo "Created files: $html_file, $css_file, and $js_file in directory '$dir_name'."

