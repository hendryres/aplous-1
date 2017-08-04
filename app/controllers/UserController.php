<?php

class UserController extends ControllerBase
{
	public function initialize() 
	{
		$this->tag->setTitle( "USER" );
		parent::initialize();
	}
	
    public function indexAction()
    {
		/* menu poli */
		$poli = Masterpoli::find();
		$this->view->data=$poli;
    }
	
	public function registerAction()
    {
 
        $user = new User();
 
        $password = $this->request->getPost('txtpassword');
		$chk1 = $this->request->getPost('check1') ? 1 : 0;
		$chk2 = $this->request->getPost('check2') ? 1 : 0;
		$chk3 = $this->request->getPost('check3') ? 1 : 0;
		$chk4 = $this->request->getPost('check4') ? 1 : 0;
		$chk5 = $this->request->getPost('check5') ? 1 : 0;
		$chk6 = $this->request->getPost('check6') ? 1 : 0;
		$chk7 = $this->request->getPost('check7') ? 1 : 0;
		$akses = $chk1.$chk2.$chk3.$chk4.$chk5.$chk6.$chk7;
 
        $user->fldfirstname = $this->request->getPost('txtnamadepan');
		$user->fldlastname = $this->request->getPost('txtnamabelakang');
		$user->fldusername = $this->request->getPost('txtusername');
		$user->fldpassword = $password;
		$user->fldinstalasi = $this->request->getPost('cmbinstalasi');
		$user->fldpoli = $this->request->getPost('cmbpoli');
		$user->fldakses = $akses;
 
        if ( !$user->save() ) 
		{
			echo 0;
		}
		else
		{
			echo 1;
		}
    }
}

