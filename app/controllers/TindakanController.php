<?php

class TindakanController extends ControllerBase
{
	public function initialize() 
	{
		$this->tag->setTitle( "TINDAKAN" );
		parent::initialize();
	}
	
    public function indexAction()
    {
		$poli = Masterpoli::find();
		$this->view->data=$poli;
    }

}

