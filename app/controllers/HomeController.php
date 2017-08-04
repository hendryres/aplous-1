<?php

class HomeController extends ControllerBase
{
	public function initialize() 
	{
		$this->tag->setTitle( "HOME" );
		parent::initialize();
	}
	
    public function indexAction()
    {
		/* menu poli */
		$poli = Masterpoli::find();
		$this->view->data=$poli;
    }

}

