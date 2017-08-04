<?php

class MasterController extends ControllerBase
{
	public function initialize() 
	{
		$this->tag->setTitle( "Master" );
		parent::initialize();
	}
	
    public function indexAction()
    {
		/* menu poli */
		$poli = Masterpoli::find();
		$this->view->data=$poli;
    }

}

