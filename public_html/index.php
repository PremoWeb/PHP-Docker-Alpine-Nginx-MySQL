<?php

require 'vendor/autoload.php';

$f3 = \Base::instance();

$f3->config('config.ini');

$f3->route('GET /',
    function(\Base $f3) {
       $f3->set('title',"Hello, world!");
       echo Template::instance()->render('default.html');
    }
);

$f3->route('GET /api/now',
    function(\Base $f3) {
       echo date('Y-m-d H:i:s');
    }
);

$f3->run();

?>