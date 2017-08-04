<?php

class IrjController extends ControllerBase
{
	public function initialize() 
	{
		$this->tag->setTitle( "IRJ" );
		parent::initialize();
	}
	
    public function indexAction()
    {
		/* menu poli */
		$poli = Masterpoli::find();
		$this->view->data=$poli;
    }

}

