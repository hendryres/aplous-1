<?php

class McuController extends ControllerBase
{
	public function initialize() 
	{
		$this->tag->setTitle( "MCU" );
		parent::initialize();
	}
	
    public function indexAction()
    {
		/* menu poli */
		$poli = Masterpoli::find();
		$this->view->data=$poli;
    }

}

