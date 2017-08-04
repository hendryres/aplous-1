<?php

class PendaftaranController extends ControllerBase
{
	public function initialize() 
	{
		$this->tag->setTitle( "Pendaftaran" );
		parent::initialize();
	}
	
    public function indexAction()
    {
		/* menu poli */
		$poli = Masterpoli::find();
		$this->view->data=$poli;
    }

}

