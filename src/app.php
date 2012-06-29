<?php

$app->get('/setup', function() use ($app) { 
	$sql = "CREATE TABLE IF NOT EXISTS news (
		id	INT NOT NULL,
		title TEXT,
		short_desc TEXT,
		body TEXT,
		PRIMARY KEY(id)
	)";
	$post = $app['db']->query($sql);
	for($i=1; $i<11; $i++) {
		$sql = "INSERT INTO news (id, title, short_desc, body) VALUES 
			($i, 'Test $i', 'Test $i', 'Test $i')";
		$post = $app['db']->query($sql);
	}
	
	return "done";
});

$app->get('/{id}', function ($id) use ($app) {
	$sql = "SELECT * FROM news WHERE id = ?";
	$post = $app['db']->fetchAssoc($sql, array($id));
    return 'Hello '.$app->escape($post["title"]);
});