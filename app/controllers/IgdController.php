<?php

class IgdController extends ControllerBase
{
	public function initialize() 
	{
		$this->tag->setTitle( "IGD" );
		parent::initialize();
	}

    public function indexAction()
    {
		/* menu poli */
		$poli = Masterpoli::find();
		$this->view->data=$poli;
    }

}

