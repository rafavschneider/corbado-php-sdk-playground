<?php

use Corbado\Client;

require __DIR__  . '/vendor/autoload.php';

$corbadoClient = new Client(getenv('CORBADO_USER'), getenv('CORBADO_PASSWORD'));
