#!/usr/bin/env php
<?php

exec('git diff --name-only --cached', $files, $success);
if ($success != 0) {
	echo "Something went wrong finding modified files:\n";
	var_dump($files);
	exit(1);
}

foreach ($files as &$value) {
	$value = escapeshellarg($value);
}

$files = implode(' ', $files);
$command = 'egrep -rls "^<<<<<<< |^>>>>>>> |^=======$" ' . $files . ' | xargs file | egrep \'script|text\'';
exec($command, $files);
if (!empty($files)) {
    echo "Files are unmerged: \n";
    foreach ($files as $file) {
        echo ' - ' . substr($file, 0, strpos($file, ': ')) . "\n";
    }
    echo "\n";
    exit(1);
}
