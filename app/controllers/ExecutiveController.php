<?php

class ExecutiveController extends \Phalcon\Mvc\Controller
{

    public function indexAction()
    {
		/* menu poli */
		$poli = Masterpoli::find();
		$this->view->data=$poli;
    }

}

