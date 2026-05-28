<?php
require __DIR__ . "/vendor/autoload.php";
use ZealPHP\App;

App::superglobals(true);
App::enableCoroutine(false);
App::processIsolation(false);
App::functionIsolation(true);
App::documentRoot('/apps');
App::ignorePhpExt(false);

$app = App::init('0.0.0.0', 8080);
$app->setFallback(fn() => 404);
$app->run();
