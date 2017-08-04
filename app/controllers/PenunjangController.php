<?php

class PenunjangController extends ControllerBase
{
	public function initialize() 
	{
		$this->tag->setTitle( "PENUNJANG" );
		parent::initialize();
	}
	
    public function indexAction()
    {
		/* menu poli */
		$poli = Masterpoli::find();
		$this->view->data=$poli;
    }

}

