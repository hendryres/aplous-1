<?php

class RekammedisController extends \Phalcon\Mvc\Controller
{

    public function indexAction()
    {
		/* menu poli */
		$poli = Masterpoli::find();
		$this->view->data=$poli;
    }

}

