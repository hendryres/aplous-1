<?php

class UsersController extends ControllerBase
{
	public function initialize() 
	{
		$this->tag->setTitle( "USERS" );
		parent::initialize();
	}
    public function indexAction()
    {
		/* menu poli */
		$poli = Masterpoli::find();
		$this->view->data=$poli;
    }

}

